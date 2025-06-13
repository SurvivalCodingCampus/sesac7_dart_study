import 'package:modu_3_dart_study/20250613/tangibleAsset.dart';

class Book extends TangibleAsset {
  String isbn;
  double _weight = 0.0;

  Book(super.name, {required super.price, required super.color, required this.isbn});

  @override
  double get weight => _weight;

  @override
  set weight(double weight) => _weight = weight;

}