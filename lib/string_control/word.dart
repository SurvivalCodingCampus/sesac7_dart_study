class Word {
  String word = '';

  Word(this.word);

  bool isVowel(int i) {
    if(i >= word.length || i < 0) {
      throw Exception('범위 지켜라');
    }

    String vowel = 'aeiou';
    String target = word[i];
    return vowel.contains(target);
  }

  bool isConsonant(int i) {
    if(i >= word.length || i < 0) {
      throw Exception('범위 지켜라');
    }

    String vowel = 'aeiou';
    String target = word[i];
    return !vowel.contains(target); // 모음에 포함되어 있지 않다면 자음이기 때문에
  }
}