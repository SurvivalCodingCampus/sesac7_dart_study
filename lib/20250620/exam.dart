
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

  int getMaxAttempts(KeyType keyType) {
    return _maxTryCounts[keyType] ?? (throw ArgumentError('Unsupported KeyType: $keyType'));
  }

  E? get() {
    _tryCount++;

    // 현재 KeyType에 해당하는 최대 시도 횟수를 가져옴
    final maxAttempts = getMaxAttempts(_keyType);

    if (_tryCount >= maxAttempts) {
      // 횟수가 초과되면 이미 금고가 열린 상태이므로 item을 반환한다.
      return _item;
    } else {
      return null;
    }
  }
}

extension WordValidation on String {
  // 입력되는 문자열이 비어 있거나 영문이 아니라면 예외를 발생시킴
  String validateWordCheckEngEmpty() {
    if (isEmpty) {
      throw ArgumentError('word는 빈 문자일 수 없습니다.');
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(this)) {
      throw ArgumentError('word는 영문만 가능합니다.');
    }
    return this;
  }
}

class Word {
  final String _word;
  final vowels = ['a', 'e', 'i', 'o', 'u'];

  Word({required String word}) : _word = word.validateWordCheckEngEmpty();

  /// 모음인지 검사
  bool isVowel(int i) {
    if (i < 0 || i >= _word.length) throw ArgumentError('범위를 벗어났습니다.');

    bool result = false;

    // 대/소문자 모두 체크하기 위해 들어온 문자열을 소문자로 변경한다.
    String lowerCaseWord = _word.toLowerCase();

    for (var vowel in vowels) {
      if(lowerCaseWord.substring(i, i + 1) == vowel) {
        result = true;
        break;
      }
    }

    return result;
  }

  /// 자음인지 검사
  bool isConsonant(int i) {
    return !isVowel(i);
  }
}