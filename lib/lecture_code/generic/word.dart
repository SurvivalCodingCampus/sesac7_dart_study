/*
  i 번째 글자가 모음인지 알려주는 isVowel() 메서드를 완성하시오
  영어에서의 모음은 a, e, i, o, u 다섯가지이다
*/

/*
  i 번째 글자가 자음인지 알려주는 isConsonant() 함수를 수정하시오
*/

class Word {
  String word = '';

  bool isVowel(int i) {
    if (checkZeroMinus(word, i)) {
      i--;
    } else {
      return false;
    }

    return CheckVowelConsonant(word, i, 'isVowel'); //소문자로
  }

  bool isConsonant(int i) {
    if (checkZeroMinus(word, i)) {
      i--;
    } else {
      return false;
    }
    return CheckVowelConsonant(word, i, 'isConsonant');
  }
}

// 문자 체크(무입력 및 초과숫자입력)
bool checkZeroMinus(String word, int i) {
  if (word.length < i || i <= 0) return false;
  return true;
}

CheckVowelConsonant(String word, int i, String isVowelConsonant) {
  bool isVowelBool = isVowelConsonant == 'isVowel' ? true : false;

  switch (word.substring(i, i + 1).toLowerCase()) {
    case 'a':
      return isVowelBool;
    case 'e':
      return isVowelBool;
    case 'i':
      return isVowelBool;
    case 'o':
      return isVowelBool;
    case 'u':
      return isVowelBool;
    case ' ':
      return !isVowelBool;
    default:
      return !isVowelBool;
  }
}
