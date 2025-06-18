import 'package:modu_3_dart_study/assignments/2025-06-13/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(
    super.weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}
