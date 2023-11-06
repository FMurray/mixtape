#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <cmath>
#include <fstream>
#include <vector>
#include <limits>

#include <AudioFile.h>
#include "kfr/all.hpp"

using namespace kfr;
using namespace std;

// Constants for the audio
const int sampleRate = 44100; // CD Quality
const double duration = 0.1;  // Duration of each bit in seconds
const float freqOne = 440.f;  // Frequency for binary '1'
const float freqZero = 880.f; // Frequency for binary '0'
const double PI = 3.14159265358979323846;

// Function to convert a string to a vector of bools representing binary data
std::vector<bool> stringToBinary(const std::string &text)
{
  std::vector<bool> binaryData;

  for (char c : text)
  {
    std::bitset<8> charBits(c);
    // Push each bit of the character into the vector, MSB first
    for (int i = 7; i >= 0; --i)
    {
      binaryData.push_back(charBits.test(i));
    }
  }

  return binaryData;
}

std::string binaryToString(const std::vector<bool> binaryData)
{
  std::string text;

  for (size_t i = 0; i < binaryData.size(); i += 8)
  {
    std::bitset<8> charBits;
    // Read each bit of the character from the vector, MSB first
    for (int j = 7; j >= 0; --j)
    {
      charBits[j] = binaryData[i + (7 - j)];
    }
    text += static_cast<char>(charBits.to_ulong());
  }

  return text;
}

// Function to generate FSK signal
void writeFSKSignal(const std::vector<bool> &data, const std::string &filePath)
{
  AudioFile<float> a;
  a.setNumChannels(1);

  const float sampleRate = 44100.f;
  const float freqOne = 440.f;  // Frequency for binary '1'
  const float freqZero = 880.f; // Frequency for binary '0'
  const int bitsPerSecond = 10; // This is the baud rate
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

  const int sampleRate = 44100; // Your actual sample rate
  const int baudRate = 10;      // Your actual baud rate
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

    if (dominantFrequency == freqOne)
    {
      binaryData.push_back(true);
    }
    else if (dominantFrequency == freqZero)
    {
      binaryData.push_back(false);
    }
    else
    {
      // Error
    }
    // Map the dominant frequency to data...
    // Your code to map frequency to the encoded data goes here
  }

  return binaryData;
}

int main()
{
  std::string message = "Hey Dickhead";

  // Binary data to encode
  std::vector<bool> data = stringToBinary(message);

  // Output file name
  std::string fileName = "fsk_signal.wav";

  // Generate FSK signal
  // writeFSKSignal(data, fileName);

  std::vector<bool> decoded = readWavFileAndDecodeFSK(fileName);

  println("Decoded message: ", binaryToString(decoded));

  // readAndPlotWav(fileName);

  return 0;
}