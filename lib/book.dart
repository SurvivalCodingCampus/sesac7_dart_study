import 'package:modu_3_dart_study/tangible_asset.dart';

class Book extends TangibleAsset {
  final String _isbn;

  @override
  double weight;

  String get isbn => _isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required String isbn,
    required this.weight,
  }) : _isbn = isbn;
}
