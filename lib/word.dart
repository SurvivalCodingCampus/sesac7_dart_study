class Word {
  String word = '';
  // String 에 담기는 값이 문자열이라서 i 를 추적할 수 있음

  bool isVowel(int i) {
    // ignore: unused_local_variable
    List list = List.unmodifiable(['a', 'e', 'i', 'o', 'u']); // 수정이 안되는 리스트 형식, add 나 리스트를 수정하는 순간 터지게 만들어져있음

    if (i < 0 || i >= word.length) {
      throw RangeError('Index $i is out of range for word of length ${word.length}');
    }

    String lo = word[i].toLowerCase();
    // return lo == 'a' || lo == 'e' || lo == 'i' || lo == 'o' || lo == 'u';
    return 'aeiou'.contains(lo);
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }

  Word(this.word);
}

// 예외조건 검색 조건 인것 처럼 추가하는 것 작성 필요
// 정규식 체크
