class Word {
  String word;

  Word({this.word = ''});

  static const vowels = ['a', 'e', 'i', 'o', 'u'];

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) {
      throw Exception('i가 잘못됐다');
    }
    String alphabet = word.substring(i, i + 1).toLowerCase();

    return vowels.contains(alphabet);
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}
