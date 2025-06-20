
enum KeyType {
  padlock,
  button,
  dial,
  finger
}

class StrongBox<E> {
  E? _item;
  final KeyType _keyType;

  // 각 KeyType에 대한 최대 시도 횟수를 Map으로 정의
  static final Map<KeyType, int> _maxTryCounts = {
    KeyType.padlock: 1024,
    KeyType.button: 10000,
    KeyType.dial: 30000,
    KeyType.finger: 1000000,
  };

  int _tryCount = 0;
  int get tryCount => _tryCount;

  StrongBox({required KeyType keyType}) : _keyType = keyType;

  void put(E item) => this._item = item;

  E? get() {
    _tryCount++;

    // 현재 KeyType에 해당하는 최대 시도 횟수를 가져옴
    final maxAttempts = _maxTryCounts[_keyType];

    if ( maxAttempts == null ) {
      throw Exception("Invalid KeyType");
    } else {
      if (_tryCount >= maxAttempts) {
        //_tryCount = 0;
        return _item;
      } else {
        return null;
      }
    }
  }
}

class Word {
  String word = '';
  final vowels = ['a', 'e', 'i', 'o', 'u'];

  bool isVowel(int i) {
    bool result = false;
    for (var vowel in vowels) {
      if(word.substring(i, i + 1) == vowel) {
        result = true;
        break;
      }
    }

    return result;
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}