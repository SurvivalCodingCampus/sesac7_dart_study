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
}