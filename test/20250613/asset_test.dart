
import 'package:modu_3_dart_study/20250613/Computer.dart';
import 'package:modu_3_dart_study/20250613/book.dart';
import 'package:modu_3_dart_study/20250613/patent.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late Book book;
  late Computer computer;
  late Patent patent;

  group('추상화 킄래스, 인터페이스 테스트', () {
    setUp(() {
      book = Book('수학', price: 20000, color: 'red', weight: 1, isbn: '1204293409182');
      computer = Computer('맥프로', price: 2000000, color: 'silver', weight: 2, makerName: 'apple');
      patent = Patent('식물특허', price: 30000, right: '신품종 보호', country: '한국');
    });
    test('생성 후 결과확인', () {
      expect(book.weight, 1);
      expect(computer.weight, 2);
      expect(patent.name, '식물특허');
    });
  });
}