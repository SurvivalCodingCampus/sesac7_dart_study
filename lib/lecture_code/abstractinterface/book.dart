import 'package:modu_3_dart_study/lecture_code/abstractinterface/tangibleasset.dart';

class Book extends TangibleAsset {
  String isbn;

  // 인터페이스에 getter/setter가 있으면 non-final 필드 하나로 가능하다.
  // getter/setter는 접근 방법을 정의
  // 실제 데이터를 저장할 공간은 non-final 필드 1개면 충분
  // 즉 인터페이스에서는 getter setter만을 약속 받을뿐 실제로 저장은 클래스안에서 non-final로 하면된다.
  // 그런데 만약 final로하면 set을 한번만 하네.

  double weight;

  Book(super.name, super.price, super.color, this.isbn, {this.weight = 1});
}
