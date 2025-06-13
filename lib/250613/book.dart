import 'package:modu_3_dart_study/250613/tangible_asset.dart';

class Book extends TangibleAsset {
  final String isbn;

  Book({
    required super.weight,
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}
