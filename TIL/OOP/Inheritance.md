# Inheritance(상속)
슈퍼 클래스의 기능을 확장하는 것

```dart
class Wizard {
  static const int maxMp = 100;

  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(this._name, {required int hp, int mp = maxMp, Wand? wand})
    : _hp = hp,
      _mp = mp,
      _wand = wand;
}

class GreatWizard extends Wizard {
  static const maxMp = 150;

  GreatWizard(super.name, {required super.hp, super.mp = maxMp});
}
```
- dart의 경우 필수인 슈퍼 클래스의 생성자를 모두 지원해야 함

## is-a 원칙
- GreatWizard is a Wizard -> 슈퍼 클래스가 포괄적인 개념
- 잘못된 상속을 할 경우 '다형성'을 이용하지 못 하게 됨