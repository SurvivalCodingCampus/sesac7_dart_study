import 'package:modu_3_dart_study/thing.dart';

class Book extends TangibleAsset {
  String isbn;
  // ignore: annotate_overrides
  double weight;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
    required this.weight
  });

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Book && 
    runtimeType == other.runtimeType &&
    isbn == other.isbn;
    
  @override
  int get hashCode => isbn.hashCode;
     
}


void main(){
  final numbers = [1, 3, 2];
  numbers.sort();
  numbers.sort((a, b) => b - a); // 역순정렬

  Book book1 = Book(
    name: '홍길동전',
    price: 10000,
    color: 'red',
    isbn: '1111',
    weight: 100,
  );

  Book book2 = Book(
    name: '홍길동전',
    price: 10000,
    color: 'red',
    isbn: '1111',
    weight: 100,
  );
  
  print(book1 == book2); // true
}