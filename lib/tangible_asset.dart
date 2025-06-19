import 'thing.dart';

class Book extends TangibleAsset{
  String isbn;
  double _weight;

  // super named
  Book({
    required super.name, 
    required this.isbn,
    required super.price, 
    required super.color,
    double weight = 0, 
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

List<Thing> assets = [
  Book(name: 'book', isbn: 'isbn', price: 30, color: 'y'),
  Computer(price: 30, color: 'y', name: 'name', makerName: 'makerName'),
];

void main(){
  for(final asset in assets){
    // Thing 으로 에셋을 설정
    asset.weight;

    final book = asset as Book;
    // as의 방법이 있지만 강제로 타입 캐스팅 하는 것이기 때문에 쓰지않는다.
    // 휴먼에러를 방지하기 위해
    // 런타임에 에러 날수있음(캐스트 실패)
    
    if (asset is Book){
      // is 를 거쳐서 스마트 타입 캐스팅 book의 방법이 있다.
      
    }
  }

}


