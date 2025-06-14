import 'package:modu_3_dart_study/assignments/2025-06-13/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.isbn,
  });

  @override
  // TODO: implement weight
  double get weight => super.weight;

  @override
  set weight(double _weight) {
    // TODO: implement weight
    super.weight = _weight;
  }
}
