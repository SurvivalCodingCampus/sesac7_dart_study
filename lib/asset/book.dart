import 'package:modu_3_dart_study/asset/tanglble_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}
