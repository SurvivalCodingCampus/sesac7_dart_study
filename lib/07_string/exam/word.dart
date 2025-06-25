class Word {
  String word = '';
  // String 에 담기는 값이 문자열이라서 i 를 추적할 수 있음

  bool isVowel(int i) {
    List list = List.unmodifiable(['a', 'b']);
    list.add('3');

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