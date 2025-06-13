// 가 : 자산
abstract class Asset{
  String name;

  Asset({required this.name});
}

// 형태가 있는것
abstract interface class Thing{
  double get weight;
  set weight(value){}
}

// 나 : 무형자산
abstract class IntangibleAsset {}

// 다 : 특허권
class Patent extends IntangibleAsset{}

abstract class TangilbleAsset extends Asset implements Thing {
  int price;
  String color;

  TangilbleAsset({required super.name, required this.price, required this.color, });
}

class Book extends TangilbleAsset{
  String isbn;
  double _weight;

  // super named
  Book({required super.name, required this.isbn, double weight = 0, required super.price, required super.color,}) : _weight = weight{
    this.weight = _weight;
  }

  @override
  set weight(value) {
    print('$value kg');
  }
  
  @override
  // TODO: implement weight
  double get weight => _weight;
}

class Computer extends TangilbleAsset{
  String makerName = '';
  double _weight;

  Computer({required super.price, required super.color, required super.name, double weight = 0, required this.makerName}) : _weight = weight{
    this.weight = _weight;
  }
  
  @override
  double get weight => _weight;
  
  @override
  set weight(value) {
    print('$value kg');
  }  
}



