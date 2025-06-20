class Word {
  String word = '';

  Word({required this.word});

  bool isVowel(int i) {
    if (i > 0) {
      String char = word.substring(i - 1, i).toLowerCase();

      return char == 'a' ||
          char == 'e' ||
          char == 'i' ||
          char == 'o' ||
          char == 'u';
    } else {
      return false;
    }
  }

  bool isConsonant(int i) {
    if (i > 0) {
      return !isVowel(i);
    } else {
      return false;
    }
  }
}
