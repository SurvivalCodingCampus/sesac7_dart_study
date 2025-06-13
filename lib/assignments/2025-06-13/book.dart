import 'package:modu_3_dart_study/assignments/2025-06-13/tangible_asset.dart';

class Book extends Tangibleasset {
  String isbn;

  Book(
    super.name, {
    required super.price,
    required super.color,
    required super.weight,
    required this.isbn,
  });
}
