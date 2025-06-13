// 어떤 회사에서 자산관리 프로그램을 만들려고 한다. 현시점에서 컴퓨터, 책 을 표현하는, 다음과 같은 두개의 클래스가 있다
// 이후, 컴퓨터와 책 이외에도 여러가지 자산을 관리하고 싶은 경우에 유용한 유형자산(TangibleAsset) 이라는 이름의 추상클래스를 작성 하시오.
// 또, Computer 나 Book 은 그 부모 클래스를 활용한 형태로 수정 하시오.

import 'package:modu_3_dart_study/250604/asset.dart';

abstract class TangibleAsset extends asset {
  String name;
  int price;
  String color;

  TangibleAsset(this.name, this.price, this.color);
}

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, this.isbn);
}

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, this.makerName);
}

void main(){
  // TangibleAsset tangibleAsset = TangibleAsset(); // 추상클래스는 인스턴스화할 수 없다.
  Computer com = Computer('컴퓨터', 10, 'white', '삼보');
}