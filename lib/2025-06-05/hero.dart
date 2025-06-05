import 'package:modu_3_dart_study/2025-06-04/hero.dart';

// top-level 변수
// 공통적으로 모든 파일에서 쓸수있게 된다
// 의미를 명확히 한 값으로 작성한다 예.heroMoney
int money = 100;

class Person{
  // 생성자를 작성하지 않았을때 Person(); 이 있는 것으로 판단하고 사용 가능
}

void main(){
  final hero1 = Hero(name: '홍길동', hp: 100);
  final hero2 = hero1;
  hero2.hp = 200;

  print(hero1);
  // hero1 = 200
  // dart 는 모든 타입이 참조형
  // hero2의 hp는 hero1에서 Hero type에 만들어진 hp 값에 100을 생성한 위치에서 값을 조회하고 있기 때문에

  Person(); 
  // 생성자를 작성하지 않을 시에만 기본 생성자가 있는 것으로 본다
  // 생성자 만드는 순간 기본 생성자는 사라진다
}

