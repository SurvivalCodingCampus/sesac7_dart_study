import 'package:modu_3_dart_study/hero.dart';

void main() {
  // String name = '';
  // name.toString();
  // name.hashCode;

  ///이 메소드와 프로퍼티의 원래 주인이 누구냐? Object이다.
  ///Object라고 하는놈이 이런것들을 주고 있다. 어떻게 주냐? 상속?
  ///ctrl+h키를 클래스에 두고 누르면 상속관계를 볼 수 있다.
  ///String 클래스는 Object클래스의 자식관계.
  ///
  // Hero hero = Hero(name: 'asd', hp: 1);

  ///이 Hero클래스도 Object를 상속받음.
  ///객체는 암묵적으로 모든 클래스는 Object성질을 가지고 있는것으로 본다.
  ///Object는 다트뿐아니라, 자바등 객체지향성질을 지닌 언어가 모두 그렇다.
  ///
  // print(hero.toString()); //Instance of Hero
  ///toString()이 뭐냐? 왜 Instance of Hero가 나오냐?
  ///toString()을 따라가다 보면, 다트에서 코드를 타고 가다보면 안보이는 코드들이 있는데, 알맹이를 확인할 수 없는데
  ///어딘가에 Instance of Hero처럼 출력하는 코드가 있을 것이다. 기본적으로 toString()을 하면 이렇게 나오는게 디폴트이다.
  ///그러나 String의 toString()은 어딘가에 String 내용자체를 출력하라는 내용이 있다.
  ///내가 만든 클래스를 표현하는건 toString()을 재정의해서 출력하게 만들 수 있다.

  // print(hero);
  //
  // List<int> numbers = [1, 2, 3, 4];
  // print(numbers.toString()); //[1,2,3,4]로 출력이 나오는것도 이미 재정의를 이런식으로출력하게 만들어둔것임.

  // final heroes = <Hero>{};
  // List<Hero> heroes = [];
  // final h1 = Hero(name: '슈퍼맨', hp: 100);
  // final h2 = Hero(name: '슈퍼맨', hp: 100);
  //
  // heroes.add(h1);
  // print(heroes.length);
  //
  // heroes.remove(h2);
  // print(heroes.length);
  //
  // print(h1 == h2);

  /// 리스트는 내부에 있는 동등성 검사를 ==으로한다. 주소로하는게 아니다.

  /// 내가 만든 클래스의 동등성 비교 재정의를 하면 리스트에서도 같은놈으로 판단할 수 있다.

  /// 주소기반으로만 비교를 하는게아니라,

  /// ==(equals) 를 재정의하여 == 비교시 나만의 동등성 규칙을 정의할 수 있음.
  /// List에서 동등성 비교시 사용됨.
  /// ==은 참조 비교가 아니다. 그 객체가 정의한 동등성 규칙에 의거하여 판단하지만, identical()은 실제 객체 참조 주소를 비교하여 bool값을 반환한다.
  // print(identical(h1, h2));

  ///identical(object,object)는 실제 객체 참조 주소를 비교한다.
  // final p1 = Person(name: 'dlrl');
  // final p2 = p1;
  // print(identical(p1, p2));

  ///-----------------------------------------------------------------------------------------------
  ///hashcode 재정의.
  ///
  // print(h1.hashCode);
  // print(h2.hashCode);

  ///hashcode는 실행할때 마다 무작위로 바뀐다.
  ///해시 알고리즘. 내부적으로 돌아서 숫자를 생성해주고, 각 객체마다 부여가 된다.
  ///메모리 주소를 볼 수는 없지만, 볼 방법이 없지만, 대체로 해시코드를 메모리 주소라는 개념으로 생각해도 무방하다.
  ///다 다른 값을 가지고 있을거라서, 이거 가지고 객체가 같은지 다른지를 비교한다고 보면된다.

  // print('홍길동'.hashCode);
  // print('홍길동'.hashCode); //같은 값이 나옴.
  ///String은 String pool이라고 하는 공간에 넣어놓고, 거기서 가져다 씀. 두개는 같은 인스턴스라고 봄.
  ///동등성 체크는 hashCode와 ==의 재정의를 같이해서 사용하자. 자동으로 generate해서.
  ///
  /// Set,Map 계열은 요소를 검색할 때 hashCode를 사용하여 비교해서 빠르다. List는 순차검색이라 느리다.
  /// 1. 모든 객체는 해시값을 가진다.
  /// 2. 동일한 객체는 항상 같은 해시값을 가진다.
  ///
  ///
  ///
  /// CopyWith.
  /// 복사.
  Hero hero1 = Hero(name: '홍길', hp: 100);
  Hero hero2 = hero1.copyWith(name: '길', hp: 200);
  print(hero2);

  Address address = Address(street: 'ads');
  Person pp = Person(name: 'asd', address: address);
  Person ppp = pp.shallowCopy();

  print(identical(pp, ppp));

  ///false. 복사해서 새로 만들었기때문에 다르다.
  ///
}

class Person {
  final String name;
  Address address;

  Person({required this.name, required this.address});

  //얉은 복사
  Person shallowCopy() => Person(name: name, address: address);
}

class Address {
  String street;

  Address({required this.street});

  //깊은 복사
  Address deepCopy() => Address(street: street);
}
