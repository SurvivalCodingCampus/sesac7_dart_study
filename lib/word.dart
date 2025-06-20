class Word {
  String _word;

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
    String charAt = word.substring(i - 1, i);

    // 공백이면 모음에 해당하지 않으므로 false를 리턴
    if (charAt == ' ') {
      return false;
    }

    // gatherAlphabet에 저장된 모든 값들과 비교하여 같은 값이 존재한다면 모음인 것이므로 true를 리턴
    for (int j = 0; j < gatherAlphabet.length; j++) {
      if (charAt == gatherAlphabet[j]) {
        return true;
      }
    }

    // gatherAlphabet에 같은 값이 없다면 모음이 아니므로 false를 리턴
    return false;
  }

  bool isConsonant(int i) {
    String charAt = word.substring(i - 1, i);

    // 공백이면 자음에 해당하지 않으므로 false를 리턴
    if (charAt == ' ') {
      return false;
    }

    // isVowel 결과가 true로 해당 글자가 모음인 것이 확정 되면 자음이 아니므로 false를 리턴
    if (isVowel(i)) {
      return false;
    }

    // 아스키코드 상으로 대문자, 소문자가 아닐 경우 자음이 아님
    if (charAt.codeUnits[0] > 64 && charAt.codeUnits[0] < 91) {
      return true;
    } else if (charAt.codeUnits[0] > 96 && charAt.codeUnits[0] < 123) {
      return true;
    } else {
      return false;
    }
  }
}
