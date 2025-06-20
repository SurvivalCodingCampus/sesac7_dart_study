class Word {
  String word = '';
  // String 에 담기는 값이 문자열이라서 i 를 추적할 수 있음

  bool isVowel(int i) {
    
    String lo = word[i].toLowerCase();
    // return lo == 'a' || lo == 'e' || lo == 'i' || lo == 'o' || lo == 'u';
    return ('aeiou').contains(lo);
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }

  Word(this.word);
}

// 예외조건 추가하는 것 작성 필요
