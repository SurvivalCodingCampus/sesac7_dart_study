
import 'package:modu_3_dart_study/20250613/Computer.dart';
import 'package:modu_3_dart_study/20250613/book.dart';
import 'package:modu_3_dart_study/20250613/patent.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late Book book;
  late Computer computer;
  late Book magicBook;
  late Patent patent;

  group('추상화 클래스, 인터페이스 테스트', () {
    setUp(() {
      book = Book('수학', price: 20000, color: 'red', isbn: '1204293409182');
      magicBook = Book('마법책', price: 10000000000, color: 'transparent', isbn: '0000000000');
      computer = Computer('맥프로', price: 2000000, color: 'silver', makerName: 'apple');
      patent = Patent('식물특허', price: 30000, right: '신품종 보호', country: '한국');
    });
    test('생성 후 결과확인', () {
      expect(book.name, '수학');
      expect(magicBook.price, 10000000000);
      expect(computer.color, 'silver');
      expect(patent.country, '한국');
    });
    test('무게 설정에 따른 테스트', (){
      book.weight = 0.5;
      expect(book.weight, 0.5);
      computer.weight = 2.0;
      expect(computer.weight, 2.0);
      expect(() => magicBook.weight = -100.0, throwsException);
    });
  });
}