// 모든 클래스는 Object 클래스를 암묵적으로 상속한다.
// 문서를 보아도 명시적으로 extends 되어 있지는 않지만, 최상위 개념 클래스는 Object이다.
// Object 클래스는 toString() 메소드, hashCode 프로퍼티, == 연산자를 가지며,
// 모든 클래스는 Object 클래스의 멤버를 사용 가능하다.

import 'package:collection/collection.dart';

class Person implements Comparable<Person> {
  String _name;
  int _height;
  double _weight;

  Person({required String name, required int height, required double weight})
    : _name = name,
      _height = height,
      _weight = weight;

  // toString() 메소드를 오버라이드하여 원하는 문자열을 리턴하도록 설정할 수 있다.
  @override
  String toString() {
    return _name;
  }

  // '==' 연산자를 재정의 할 수도 있다.
  //
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          _name == other._name &&
          _height == other._height &&
          _weight == other._weight;

  // 객체 복사 메소드. copyWith라는 메소드명을 통상적으로 사용한다.
  // 얕은 복사를 실현한다.
  Person copyWith({String? name, int? height, double? weight}) {
    return Person(
      name: name ?? _name,
      height: height ?? _height,
      weight: weight ?? _weight,
    );
  }

  @override
  int compareTo(Person other) {
    if (_height > other._height) {
      return 1;
    } else {
      return -1;
    }
  }

  // hashCode 프로퍼티를 오버라이드하여 원하는 값을 넣어주는 것도 가능하다.
  // 아래와 같이 프로퍼티가 나타낼 값을 _height로 설정하면,
  // hashCode를 호출할 때 Person의 키를 리턴한다.
  // int get hashCode => _height;
}

void main() {
  Person person1 = Person(name: '이학민', height: 10, weight: 75.0);
  Person person2 = Person(name: '홍길동', height: 170, weight: 60.0);
  Person person3 = Person(name: '카리나', height: 145, weight: 46.0);
  Person person4 = Person(name: '윈터', height: 150, weight: 45.0);
  Person person5 = person4.copyWith(height: 190, weight: 85.0);
  List<Person> pList = [];

  pList.add(person1);
  pList.add(person2);
  pList.add(person3);
  pList.add(person4);
  pList.add(person5);

  pList.sorted();
  for (int i = 0; i < pList.length; i++) {
    print(pList[i].hashCode);
  }
  // print(pList);

  // List<String> iList = ['하', '르', '다', '가', '사'];
  // iList.sort(); // dart의 sort는 원본을 변경한다.
  // print(iList);

  // Person person1 = Person(name: '이학민', height: 183, weight: 75.0);
  // Person person2 = Person(name: '이학민', height: 170, weight: 60.0);
  // Person person3 = Person(name: '이학민', height: 170, weight: 60.0);
  // List<Person> pList = [];
  //
  // pList.add(person2);
  // pList.add(person1);
  // pList.add(person3);
  // // pList.remove(person2);
  // // pList.remove(person2);
  // // pList.remove(person2);
  //
  // print(person1.toString());
  // print(person1.hashCode);
  // print(person2.toString());
  // print(person2.hashCode);
  // print(person3.toString());
  // print(person3.hashCode);
  //
  // print(person1 == person2);
  // print(pList.length);
  // print(pList[0].hashCode);
  // print(pList[1].hashCode);
  // print(pList[2].hashCode);
}
