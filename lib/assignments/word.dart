class Word {
  String word = '';
  final List<String> _vowel = ['a', 'e', 'i', 'o', 'u'];

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) return false;
    String char = word[i].toLowerCase();

    return _vowel.contains(char);
  }
}
