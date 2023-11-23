#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <cmath>
#include <fstream>
#include <vector>
#include <limits>
#include <thread>

#include <AudioFile.h>
#include "kfr/all.hpp"
#include <nlohmann/json.hpp> // Include the JSON library
#include <cpr/cpr.h>
#include <httplib.h>

#include "utils.h"
#include "spotify.h"
#include "server.h"

using json = nlohmann::json;
using namespace kfr;
using namespace std;

// Constants for the audio
const int sampleRate = 44100; // CD Quality
const double duration = 0.1;  // Duration of each bit in seconds
const float freqOne = 440.f;  // Frequency for binary '1'
const float freqZero = 880.f; // Frequency for binary '0'
const double PI = 3.14159265358979323846;
const int bitsPerSecond = 500; // This is the baud rate
const float frequencyThreshold = 200.0;

// Function to generate FSK signal
void writeFSKSignal(const std::vector<bool> &data, const std::string &filePath)
{
  AudioFile<float> a;
  a.setNumChannels(1);

  const float sampleRate = 44100.f;
  const float freqOne = 440.f;  // Frequency for binary '1'
  const float freqZero = 880.f; // Frequency for binary '0'
  const int samplesPerBit = sampleRate / bitsPerSecond;

  // Set the number of samples per channel based on data length and baud rate
  a.setNumSamplesPerChannel(data.size() * samplesPerBit);

  for (size_t bit = 0; bit < data.size(); bit++)
  {
    // Determine the frequency for this bit
    float frequencyInHz = data[bit] ? freqOne : freqZero;

    // Generate the samples for this bit
    for (int i = 0; i < samplesPerBit; i++)
    {
      // Calculate the sample index overall
      int sampleIndex = bit * samplesPerBit + i;
      // Write the sample to the audio buffer
      a.samples[0][sampleIndex] = sin((static_cast<float>(sampleIndex) / sampleRate) * frequencyInHz * 2.f * (float)M_PI);
    }
  }

  // Save the file
  a.save(filePath, AudioFileFormat::Wave);
}

void readAndPlotWav(const std::string &filePath)
{
  audio_reader_wav<float> reader(open_file_for_reading(filePath));
  univector2d<float> audio = reader.read_channels();
  println("Sample Rate  = ", reader.format().samplerate);
  println("Channels     = ", reader.format().channels);
  println("Length       = ", reader.format().length);
  println("Duration (s) = ", reader.format().length / reader.format().samplerate);
  println("Bit depth    = ", audio_sample_bit_depth(reader.format().type));

  // AudioFile<float> audioFile;
  // audioFile.load(filePath);
}

float getSamplePeak(const std::vector<double> &samples, size_t start, size_t end)
{
  float peak = std::numeric_limits<float>::min();
  size_t peakIndex = 0;
  for (size_t i = start; i < end; ++i)
  {
    if (samples[i] > peak)
    {
      peak = samples[i];
      peakIndex = i;
    }
  }
  return peak;
}

std::vector<bool> readWavFileAndDecodeFSK(const std::string &filePath)
{
  // Load the audio file
  audio_reader_wav<float> reader(open_file_for_reading(filePath));
  univector2d<float> audio = reader.read_channels();

  // Assume audio file is mono for simplicity
  const auto &samples = audio[0];

  const int sampleRate = 44100;       // Your actual sample rate
  const int baudRate = bitsPerSecond; // Your actual baud rate
  const int samplesPerSymbol = sampleRate / baudRate;
  const int numSymbols = samples.size() / samplesPerSymbol;

  std::vector<bool> binaryData;

  for (int symbol = 0; symbol < numSymbols; ++symbol)
  {
    // Extract the segment corresponding to the current symbol
    univector<complex<double>> segment(samples.begin() + symbol * samplesPerSymbol, samples.begin() + (symbol + 1) * samplesPerSymbol);

    // Perform FFT on this segment
    univector<complex<double>, samplesPerSymbol> fftResult = dft(segment);

    // Find magnitudes and the index of the max magnitude
    double maxMagnitude = 0;
    int maxIndex = 0;
    for (int i = 0; i < samplesPerSymbol / 2; ++i)
    { // We only need the first half of the FFT result
      double magnitude = cabs(fftResult[i]);
      if (magnitude > maxMagnitude)
      {
        maxMagnitude = magnitude;
        maxIndex = i;
      }
    }

    // Calculate the frequency of the dominant peak
    double dominantFrequency = (maxIndex * sampleRate) / samplesPerSymbol;

    println("Dominant frequency: ", dominantFrequency);
    println(abs(dominantFrequency - freqOne));
    println(abs(dominantFrequency - freqZero));

    // if (dominantFrequency == freqOne)
    // {
    //   binaryData.push_back(true);
    // }
    // else if (dominantFrequency == freqZero)
    // {
    //   binaryData.push_back(false);
    // }
    // else
    // {
    //   // Error
    // }

    // Handling potential errors or noise
    if (abs(dominantFrequency - freqOne) < frequencyThreshold)
    {
      binaryData.push_back(true);
    }
    else if (abs(dominantFrequency - freqZero) < frequencyThreshold)
    {
      binaryData.push_back(false);
    }
    else
    {
      // Handle error or noise
    }
    // Map the dominant frequency to data...
    // Your code to map frequency to the encoded data goes here
  }

  return binaryData;
}

void loadConfig()
{
  YAML::Node config = YAML::LoadFile("config.yaml");
  client_id = config["spotify"]["client_id"].as<std::string>();
  client_secret = config["spotify"]["client_secret"].as<std::string>();
  redirect_uri = config["spotify"]["redirect_uri"].as<std::string>();
}

int main(int argc, char *argv[])
{

  for (int i = 1; i < argc; ++i)
  {
    std::string arg = argv[i];

    if (arg == "--read")
    {
      std::string fileName = "fsk_signal.wav";

      std::vector<bool> decoded = readWavFileAndDecodeFSK(fileName);

      println("Decoded message: ", binaryToString(decoded));
      return 0;
    }
    else if (arg == "--another-command")
    {
      // Handle another command
    }
    // Add more else-if blocks for additional commands
  }

  // // Sample JSON
  // std::string jsonString = R"({"name": "John", "age": 30, "city": "New York"})";

  // // Parse the JSON string
  // json j = json::parse(jsonString);

  // // Convert to binary and save to a file
  // std::ofstream outputFile("output.bin", std::ios::binary);
  // jsonToBinary(j, outputFile);

  // try
  // {
  //   json j = readBinaryToJson("output.bin");
  //   std::cout << "JSON output: " << j.dump(4) << std::endl; // Pretty print with indent of 4
  // }
  // catch (const std::exception &e)
  // {
  //   std::cerr << "Error: " << e.what() << std::endl;
  // }

  loadConfig();

  httplib::Server svr;
  std::thread serverThread(runServer, std::ref(svr));

  std::string auth_url = "https://accounts.spotify.com/authorize?client_id=" + client_id +
                         "&response_type=code&redirect_uri=" + redirect_uri +
                         "&scope=user-read-private user-read-email user-top-read"; // Add other scopes as needed

  std::cout << "Please open the following URL in your browser and authorize:\n"
            << auth_url << std::endl;

  // if (readToken().empty())
  // {
  //   std::string auth_url = "https://accounts.spotify.com/authorize?client_id=" + client_id +
  //                          "&response_type=code&redirect_uri=" + redirect_uri +
  //                          "&scope=user-read-private user-read-email user-top-read"; // Add other scopes as needed

  //   std::cout << "Please open the following URL in your browser and authorize:\n"
  //             << auth_url << std::endl;
  // }
  // else
  // {
  //   std::cout << "Saved refresh token found. Using it to get a new access token." << std::endl;
  //   json accessTokenJson = getAccessToken(readToken(), client_id, client_secret, redirect_uri);
  //   std::cout << "Access token JSON: " << accessTokenJson << std::endl;
  // }

  serverThread.join();

  try
  {
    json playlists = getPlaylists();
    displayPlaylists(playlists);

    int choice = getUserPlaylistChoice(playlists.size());
    std::cout << "You selected playlist number: " << choice << std::endl;
    json selectedPlaylist = playlists[choice - 1];
    std::cout << "Selected playlist JSON: " << selectedPlaylist << std::endl;

    json playlistItems = getPlaylistItems(selectedPlaylist);
    displayPlaylistItems(playlistItems);
    std::vector<bool> data = stringToBinary(playlistItems.dump());
    // std::vector<bool> data = stringToBinary(getPlaylistTrackNames(playlistItems)[0]);

    std::string fileName = "fsk_signal.wav";
    writeFSKSignal(data, fileName);
  }
  catch (const std::exception &e)
  {
    std::cerr << "Error: " << e.what() << std::endl;
  }

  // // readAndPlotWav(fileName);

  return 0;
}