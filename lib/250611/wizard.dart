import 'package:modu_3_dart_study/250611/wand.dart';

class Wizard {
  String name;
  int hp;
  int mp;
  Wand? wand;

  //마법사 이름은 널일 수 없고, 반드시 3문자이상
  void setName(String value) {
    if (value.length < 3) {
      throw Exception('이름은 3문자이상');
    } else {
      name = value;
    }
  }

  //음수대신 0으로
  void setHP(int value) {
    if (value < 0) {
      hp = 0;
    } else {
      hp = value;
    }
  }

  //0이상이어야함
  void setMP(int value) {
    if (mp < 0) {
      throw Exception('mp는 0이상이어야한다');
    } else {
      mp = value;
    }
  }

  //null이면 안됨
  void setWand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이는 널일 수 없다');
    } else {
      wand = value;
    }
  }

  Wizard(this.name, this.hp, this.mp, this.wand) {
    //마법사 이름은 널일 수 없고, 반드시 3문자이상
    setName(name);

    //음수대신 0으로
    setHP(hp);

    //0이상이어야함
    setMP(mp);

    //null이면 안됨
    setWand(wand);
  }
}
