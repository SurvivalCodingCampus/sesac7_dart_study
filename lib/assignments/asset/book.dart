import 'package:modu_3_dart_study/assignments/asset/tangible_asset.dart';

class Book extends TangibleAsset {
  final String isbn;

  Book(
    super.name, {
    required super.price,
    required super.color,
    required this.isbn,
    required super.weight,
  });
}
