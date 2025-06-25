class Word {
  String word = '';

  Word({required this.word});

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) {
      throw Exception('$i 번째 글자는 없다.');
    }
    String char = word.substring(i, i + 1).toLowerCase();
    return char == 'a' ||
        char == 'e' ||
        char == 'i' ||
        char == 'o' ||
        char == 'u';
  }

  bool isConsonant(int i) {
    // if (i < 0 || i >= word.length) {
    //   throw Exception('$i 번째 글자는 없다.');
    // }
    return !isVowel(i);
  }
}
