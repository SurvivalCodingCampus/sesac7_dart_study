
import 'package:modu_3_dart_study/lecture_code/tangibleasset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, this.isbn);

  @override
  double get weight => 10.0;

  @override
  set weight(double weight) {
  }
}