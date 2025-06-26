# Test 코드 작성 방법

## 1. 테스트 하고 싶은 파일을 고른다

예시 : lib/cleric.dart

## 2. test 디렉토리 아래의 동일 위치에 _test를 붙인 파일을 작성한다

예시 : test/cleric_test.dart

## 테스트 코드 작성

- 여러가지 테스트 기법 중 given → when → then 기법을 사용한다
- expect 함수를 활용한 결과 검증
- 테스트 예시

```dart
// lib/cleric.dart
class Cleric {
  String name;
  int hp;
  final int maxHp = 50;
  int mp;
  final int maxMp = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    if (this.mp >= 5) {
      this.mp -= 5;
      this.hp = this.maxHp;
    }
  }
}
```

```dart
// test/cleric_test.dart
import 'package:modu_3_dart_study/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Cleric Test', () {
    // given(준비)
    Cleric cleric = new Cleric('성직자', 40, 10);

    // when(실행)
    cleric.selfAid()
		
    // then(검증)
    expect(cleric.name, equals('성직자'));
    expect(cleric.hp, equals(50));
    expect(cleric.mp, equals(5));
  });
}
```

### 생각해보기
Q.  테스트에서 클래스를 인스턴스화할 때 final 뒤에 왜 클래스명이 생략되는가?
- 타입 추론이 가능하기 때문이다