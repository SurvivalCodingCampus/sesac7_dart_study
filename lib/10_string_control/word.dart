class Word {
  String word = '';

  Word({required this.word});

  bool isVowel(int i) {
    if (i >= 1 && i <= word.length) {
      String char = word[i - 1].toLowerCase();
      return 'aeiou'.contains(char);
    } else {
      return false;
    }
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}
