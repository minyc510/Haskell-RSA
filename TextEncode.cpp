#include <iostream>
#include <unordered_map>
using namespace std;

string encode(string);
string decode(string);

int main(int argc, char* argv[]) {
  string str = argv[1];
  string type = argv[2];

  if (type[0] == 'e' || type[0] == 'E') { cout << encode(str); }
  else { cout << decode(str); }
}

string encode(string message) {
  unordered_map<char, string> encodeMap;
  for (int i=32; i<=126; i++) {
    char c = i;
    string index = to_string(i-32);
    if (i-32 < 9) { index = "0" + index; }
    encodeMap.emplace(c, index);
  }

  string encoding = "";
  for (auto c : message) { encoding += encodeMap[c]; }
  return encoding;
}

string decode(string encoding) {
  if (encoding.length() % 2 != 0) {
    return "Invalid Encoding!";
  }
  unordered_map<string, char> decodeMap;
  for (int i=32; i<=126; i++) {
    char c = i;
    string index = to_string(i-32);
    if (i-32 < 9) { index = "0" + index; }
    decodeMap.emplace(index, c);
  }

  //Read encoding two characters at a time
  string message = "";
  for (int i=0; i<encoding.length()-1; i+=2) { 
    string key = encoding.substr(i,2);
    message += decodeMap[key];

  }
  return message;
}
