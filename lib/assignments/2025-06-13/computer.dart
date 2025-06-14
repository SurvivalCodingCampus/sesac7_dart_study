import 'package:modu_3_dart_study/assignments/2025-06-13/book.dart';
import 'package:modu_3_dart_study/assignments/2025-06-13/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.makerName,
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

void main() {
  Computer computer = Computer(
    name: 'Air',
    price: 123,
    color: 'black',
    weight: 123.0,
    makerName: 'MacBook',
  );
  computer.weight = 20;
  print(computer.weight);

  Book book = Book(
    name: 'OS',
    price: 123,
    color: 'white',
    weight: 40,
    isbn: '한빛',
  );

  book.weight = 20;
  print(book.weight);
}
