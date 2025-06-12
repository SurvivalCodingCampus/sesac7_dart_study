
# Encapsulation(캡슐화)
- 휴먼 에러 방지
	- 개발자의 잘못된 접근에 대한 제어 방법 제공

## getter, setter
- read only, write only 필드 가능
- 외부에서 잘못 사용(휴먼 에러) 방지
- 유효성 검사 가능

```dart
class Wizard {
  static const minNameLength = 3;
  static const minHp = 0;
  static const minMp = 0;

  String _name;
  int _hp;
  int _mp;

  Wizard(this._name, {required int hp, required int mp})
    : _hp = hp,
      _mp = mp;

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;

  set name(String value) {
    if (value.length < minNameLength) {
      throw Exception('이름은 $minNameLength문자 이상이어야 합니다.');
    }

    _name = value;
  }

  set hp(int value) {
    if (value < minHp) {
      value = minHp;
    }

    _hp = value;
  }

  set mp(int value) {
    if (value < minMp) {
      throw Exception('MP는 $minMp 이상이어야 합니다.');
    }

    _mp = value;
  }
}
```
