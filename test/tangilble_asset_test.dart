import 'package:test/test.dart';
import 'package:modu_3_dart_study/tangilble_asset.dart';

void main() {
  test('클래스 Book을 활용한 인스턴스 올바른 생성 가능', (){
    final book = Book(name: '책이름', isbn: '안', price: 10000, color: 'yellow', weight: 4);

    expect(book.weight, 4);
  });

  test('클래스 computer을 활용한 인스턴스 올바른 생성 가능', (){
    final computer = Computer(makerName: 'apple', price: 10000, color: 'black', name: '맥', weight: 16);

    expect(computer.weight, 16);
  });
}

