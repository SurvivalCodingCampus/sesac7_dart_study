class Word {
  static const int minIndex = 0;
  static const Set<String> vowels = {'a', 'e', 'i', 'o', 'u'};
  static const Set<String> consonant = {
    'b',
    'c',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    'n',
    'p',
    'q',
    'r',
    's',
    't',
    'v',
    'w',
    'x',
    'y',
    'z',
  };

  final String _word;

  Word(String word) : _word = word;

  bool isVowel(int i) {
    return _isContainWord(index: i, words: vowels);
  }

  bool isConsonant(int i) {
    return _isContainWord(index: i, words: consonant);
  }

  bool _isContainWord({required int index, required Set<String> words}) {
    if (index < minIndex) {
      throw Exception('인덱스는 $minIndex보다 큰 값이 필요합니다.');
    }
    if (index >= _word.length) {
      throw Exception('인덱스는 글자 길이보다 작은 값이 필요합니다.');
    }

    final target = _word.toLowerCase()[index];
    return words.contains(target);
  }
}
