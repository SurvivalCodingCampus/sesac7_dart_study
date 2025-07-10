enum PhotoType {
  Article,
  Image,
  Video,
  Unknown;

  static PhotoType fromString(String s) => switch (s) {
    'article' => Article,
    "image" => Image,
    "video" => Video,
    "unknown" => Unknown,
    _ => Unknown,
  };
}

// void main() {
//   final myTime = DateTime.tryParse('9999-01-01');
//   print(myTime);
//   final myTime2 = DateTime(9999);
//   print(myTime2);
// }
