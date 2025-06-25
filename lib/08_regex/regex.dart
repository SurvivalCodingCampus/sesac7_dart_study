

void main() {
  final String menus = '짜장면,떡복이:냉면';

  print(menus.split(RegExp(r'[,:]')));

  Word.items.add(10);
}

class Word {
  static const items = [1, 2, 3];
}
