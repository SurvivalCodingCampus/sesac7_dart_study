import 'thing.dart';

class Book extends TangibleAsset{
  String isbn;
  double _weight;

  // super named
  Book({
    required super.name, 
    required this.isbn, 
    double weight = 0, 
    required super.price, 
    required super.color,
  }) : _weight = weight {
    this.weight = _weight;
  }

  @override
  set weight(double value) {
    _weight = value;
    print('$value kg');
  }
  
  @override
  double get weight => _weight;
}

class Computer extends TangibleAsset{
  String makerName;
  double _weight;

  Computer({
    required super.price, 
    required super.color, 
    required super.name, 
    double weight = 0, 
    required this.makerName
  }) : _weight = weight {
    this.weight = _weight;
  }
  
  @override
  double get weight => _weight;
  
  @override
  set weight(double value) {
    _weight = value;
    print('$value kg');
  }  
}



