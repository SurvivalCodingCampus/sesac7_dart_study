import 'package:modu_3_dart_study/20250613/tangibleAsset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, this.isbn);
}