import 'package:modu_3_dart_study/assignments/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, this.isbn);
}
