class Word {
  String _word;
  String? _charAt;

  // 모음 알파벳만이 저장된 리스트
  final List<String> gatherAlphabet = ['a', 'e', 'i', 'o', 'u'];

  // 생성자
  Word({required String word}) : _word = word;

  // getter
  String get word => _word;

  // setter
  set word(String word) => _word = word;

  // method
  bool isVowel(int i) {
    _charAt = word.substring(i - 1, i);

    // 공백이면 모음에 해당하지 않으므로 false를 리턴
    if (_charAt == ' ') {
      // print('$i번째 글자는 공백이므로 모음이 아닙니다.');
      return false;
    }

    // gatherAlphabet에 저장된 모든 값들과 비교하여 같은 값이 존재한다면 모음인 것이므로 true를 리턴
    for (int j = 0; j < gatherAlphabet.length; j++) {
      if (_charAt == gatherAlphabet[j]) {
        // print('$i번째 글자는 모음입니다.');
        return true;
      }
    }

    // gatherAlphabet에 같은 값이 없다면 모음이 아니므로 false를 리턴
    // print('$i번째 글자는 모음이 아닙니다.');
    return false;
  }

  bool isConsonant(int i) {
    _charAt = word.substring(i - 1, i);

    // 공백이면 자음에 해당하지 않으므로 false를 리턴
    if (_charAt == ' ') {
      // print('$i번째 글자는 공백이므로 자음이 아닙니다.');
      return false;
    }

    // isVowel 결과가 true로 해당 글자가 모음인 것이 확정 되면 자음이 아니므로 false를 리턴
    if (isVowel(i) == true) {
      // print('$i번째 글자는 자음이 아닙니다.');
      return false;
    }

    // 위 조건에 해당하지 않으면 자음이므로 true를 리턴
    // print('$i번째 글자는 자음입니다.');
    return true;
  }
}
