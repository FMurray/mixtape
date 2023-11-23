#include <nlohmann/json.hpp> // Include the JSON library

using json = nlohmann::json;

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

void jsonToBinary(const json &j, std::ostream &out)
{
  // Example conversion: simply write the JSON as a string
  // In a real application, you'd define a more complex binary format
  std::string jsonString = j.dump();
  out.write(jsonString.c_str(), jsonString.size());
  // return stringToBinary(jsonString);
}

json readBinaryToJson(const std::string &filename)
{
  std::ifstream inputFile(filename, std::ios::binary);

  // Check if the file was opened successfully
  if (!inputFile.is_open())
  {
    throw std::runtime_error("Could not open file");
  }

  // Read the entire file into a string
  std::string binaryString((std::istreambuf_iterator<char>(inputFile)),
                           std::istreambuf_iterator<char>());

  // Assuming the binary file is a direct dump of a JSON string
  json j = json::parse(binaryString);

  return j;
}

std::string join(const std::vector<std::string> &vec, const std::string &sep)
{
  std::string result;
  for (size_t i = 0; i < vec.size(); ++i)
  {
    result += vec[i];
    if (i < vec.size() - 1)
    {
      result += sep;
    }
  }
  return result;
}

std::string base64_encode(const std::string &in)
{
  std::string out;

  int val = 0, valb = -6;
  for (unsigned char c : in)
  {
    val = (val << 8) + c;
    valb += 8;
    while (valb >= 0)
    {
      out.push_back("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[(val >> valb) & 0x3F]);
      valb -= 6;
    }
  }
  if (valb > -6)
    out.push_back("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[((val << 8) >> (valb + 8)) & 0x3F]);
  while (out.size() % 4)
    out.push_back('=');
  return out;
}