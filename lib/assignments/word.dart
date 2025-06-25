class Word {
  final String word;
  final List<String> _vowel = ['a', 'e', 'i', 'o', 'u'];

  Word({required this.word});

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) return false;
    String char = word[i].toLowerCase();

    return _vowel.contains(char);
  }

  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) return false;
    String char = word[i].toLowerCase();

    // 정규식 체크
    final bool isNotWord = !RegExp(r'^[a-z]$').hasMatch(char);
    if (isNotWord) {
      return false;
    }
    return !_vowel.contains(char);
  }
}
