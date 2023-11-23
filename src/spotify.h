#include <string>
#include <stdexcept>

#include <nlohmann/json.hpp> // Include the JSON library
#include <cpr/cpr.h>
#include <yaml-cpp/yaml.h>

using json = nlohmann::json;

void saveToken(const std::string &refreshToken)
{
  std::ofstream tokenFile("spotify_refresh_token.txt");
  if (tokenFile)
  {
    tokenFile << refreshToken;
    tokenFile.close();
    std::cout << "Refresh token saved." << std::endl;
  }
  else
  {
    std::cerr << "Unable to open file for writing." << std::endl;
  }
}

std::string readToken()
{
  std::string refreshToken;
  std::ifstream tokenFile("spotify_refresh_token.txt");
  if (tokenFile)
  {
    getline(tokenFile, refreshToken);
    tokenFile.close();
  }
  else
  {
    std::cerr << "No saved refresh token found." << std::endl;
  }
  return refreshToken;
}

json getAccessToken(const std::string &code, const std::string &client_id, const std::string &client_secret, const std::string &redirect_uri)
{
  auto response = cpr::Post(cpr::Url{"https://accounts.spotify.com/api/token"},
                            cpr::Header{{"Content-Type", "application/x-www-form-urlencoded"}},
                            cpr::Payload{{"grant_type", "authorization_code"},
                                         {"code", code},
                                         {"redirect_uri", redirect_uri},
                                         {"client_id", client_id},
                                         {"client_secret", client_secret}});

  json responseJson = json::parse(response.text);

  if (responseJson.contains("access_token"))
  {
    // Save the access token (and refresh token, if present) for future use
    std::string accessToken = responseJson["access_token"];
    saveToken(accessToken); // Assuming saveToken now saves the access token

    if (responseJson.contains("refresh_token"))
    {
      std::string refreshToken = responseJson["refresh_token"];
      // saveToken(refreshToken); // Save the refresh token
    }

    // Return the full response JSON
    return responseJson;
  }
  else
  {
    // Handle error: the response does not contain an access token
    throw std::runtime_error("Failed to obtain access token from Spotify.");
  }
}

std::string fetchWebApi(const std::string &endpoint, const std::string &method, const json &body)
{
  std::string token = readToken();
  std::string url = "https://api.spotify.com/" + endpoint;

  cpr::Response res;
  if (method == "GET")
  {
    res = cpr::Get(cpr::Url{url}, cpr::Header{{"Authorization", "Bearer " + token}});
  }
  else if (method == "POST")
  {
    res = cpr::Post(cpr::Url{url}, cpr::Header{{"Authorization", "Bearer " + token}}, cpr::Body{body.dump()});
  }
  // Add more methods if needed

  return res.text;
}

// json getTopTracks()
// {
//   std::string endpoint = "v1/me/top/tracks?time_range=long_term&limit=5";
//   std::string response = fetchWebApi(endpoint, "GET", json({}));
//   return json::parse(response)["items"];
// }

json getPlaylists()
{
  std::string endpoint = "v1/me/playlists";
  std::string response = fetchWebApi(endpoint, "GET", json({}));
  return json::parse(response)["items"];
}

json getTopTracks()
{
  std::string endpoint = "v1/me/top/tracks?time_range=long_term&limit=5";
  std::string response = fetchWebApi(endpoint, "GET", json({}));

  if (response.empty())
  {
    throw std::runtime_error("Error: Received empty response from Spotify API.");
  }

  json jsonResponse;
  try
  {
    jsonResponse = json::parse(response);
  }
  catch (const json::parse_error &e)
  {
    throw std::runtime_error("Error parsing JSON response: " + std::string(e.what()));
  }

  if (jsonResponse.find("error") != jsonResponse.end())
  {
    // Handle API error response
    std::string errorMessage = jsonResponse["error"]["message"];
    throw std::runtime_error("Spotify API Error: " + errorMessage);
  }

  if (jsonResponse.find("items") == jsonResponse.end() || !jsonResponse["items"].is_array())
  {
    throw std::runtime_error("Error: Invalid 'items' format in response.");
  }

  return jsonResponse["items"];
}

json getPlaylistItems(const json &playlist)
{
  std::string endpoint = "v1/playlists/" + playlist["id"].get<std::string>() + "/tracks";
  std::string response = fetchWebApi(endpoint, "GET", json({}));

  if (response.empty())
  {
    throw std::runtime_error("Error: Received empty response from Spotify API.");
  }

  json jsonResponse;
  try
  {
    jsonResponse = json::parse(response);
  }
  catch (const json::parse_error &e)
  {
    throw std::runtime_error("Error parsing JSON response: " + std::string(e.what()));
  }

  if (jsonResponse.find("error") != jsonResponse.end())
  {
    // Handle API error response
    std::string errorMessage = jsonResponse["error"]["message"];
    throw std::runtime_error("Spotify API Error: " + errorMessage);
  }

  if (jsonResponse.find("items") == jsonResponse.end() || !jsonResponse["items"].is_array())
  {
    throw std::runtime_error("Error: Invalid 'items' format in response.");
  }

  return jsonResponse["items"];
}

void displayPlaylists(const json &playlists)
{
  int index = 1;
  for (const auto &playlist : playlists)
  {
    std::string playlistName = playlist["name"];
    std::cout << index++ << ": " << playlistName << std::endl;
  }
}

void displayPlaylistItems(const json &playlistItems)
{
  int index = 1;
  for (const auto &item : playlistItems)
  {
    std::string trackName = item["track"]["name"];
    std::vector<std::string> artistNames;

    for (const auto &artist : item["track"]["artists"])
    {
      artistNames.push_back(artist["name"]);
    }

    std::cout << index++ << ": " << trackName << " by " << join(artistNames, ", ") << std::endl;
  }
}

std::vector<std::string> getPlaylistTrackNames(const json &playlistItems)
{
  std::vector<std::string> trackNames;
  for (const auto &item : playlistItems)
  {
    std::string trackName = item["track"]["name"];
    trackNames.push_back(trackName);
  }
  return trackNames;
}

int getUserPlaylistChoice(int numPlaylists)
{
  std::cout << "Enter the number of the playlist you want to choose: ";
  int choice;
  while (true)
  {
    std::cin >> choice;
    if (std::cin.fail() || choice < 1 || choice > numPlaylists)
    {
      std::cin.clear();                                                   // Clear the error flag
      std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // Ignore the rest of the line
      std::cout << "Invalid input. Please enter a number between 1 and " << numPlaylists << ": ";
    }
    else
    {
      break;
    }
  }
  return choice;
}

json getSelectedPlaylist(const json &playlists, int userChoice)
{
  // Arrays are 0-indexed, so subtract 1 from the user choice
  return playlists[userChoice - 1];
}