#include <atomic>

#include <httplib.h>
#include <nlohmann/json.hpp>
#include <yaml-cpp/yaml.h>

using json = nlohmann::json;

std::atomic<bool> serverShouldStop(false);

std::string client_id;
std::string client_secret;
std::string redirect_uri;

void runServer(httplib::Server &svr)
{
  svr.Get("/", [&](const httplib::Request &req, httplib::Response &res)
          {
    std::string auth_code = req.get_param_value("code");
    // std::string state = req.get_param_value("state");

    if (auth_code.empty())
    {
      res.set_content("State mismatch error", "text/plain");
    }
    else
    {
      try
      {
        json accessTokenJson = getAccessToken(auth_code, client_id, client_secret, redirect_uri);
        // Save refresh token and use access token as needed
        // saveToken(accessTokenJson["refresh_token"]);
        res.set_content("Authorization successful", "text/plain");
        serverShouldStop.store(true); // Signal the server to stop
        svr.stop();
      }
      catch (const std::exception &e)
      {
        std::cerr << "Server thread error: " << e.what() << std::endl;
        res.set_content(std::string("Error: ") + e.what(), "text/plain");
        serverShouldStop.store(true);
        svr.stop();
      }
    } });

  while (!serverShouldStop.load())
  {
    svr.listen("localhost", 3000);
  }
}
