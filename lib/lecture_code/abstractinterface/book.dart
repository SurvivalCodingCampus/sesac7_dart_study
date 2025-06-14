import 'package:modu_3_dart_study/lecture_code/abstractinterface/tangibleasset.dart';

class Book extends TangibleAsset {
  String isbn;

  //인터페이스에 getter/setter가 있으면 non-final 필드 하나로 가능하다.
  double weight;

  Book(super.name, super.price, super.color, this.isbn, {this.weight = 1});

}
