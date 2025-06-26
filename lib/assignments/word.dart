class Word {
  static const int minIndex = 0;
  static const String vowels = 'aeiou';
  static const String consonant = 'bcdfghjklmnpqrstvwxyz';

  final String _word;

  Word(String word) : _word = word;

  bool isVowel(int i) {
    return _isContainWord(index: i, alphabets: vowels);
  }

  bool isConsonant(int i) {
    return _isContainWord(index: i, alphabets: consonant);
  }

  bool _isContainWord({required int index, required String alphabets}) {
    if (index < minIndex) {
      throw Exception('인덱스는 $minIndex보다 큰 값이 필요합니다.');
    }
    if (index >= _word.length) {
      throw Exception('인덱스는 글자 길이보다 작은 값이 필요합니다.');
    }

    final target = _word[index].toLowerCase();
    return alphabets.contains(target);
  }
}
