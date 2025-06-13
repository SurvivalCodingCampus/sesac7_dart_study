import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/book.dart';
import 'package:modu_3_dart_study/tangible_asset.dart';
import 'package:modu_3_dart_study/thing.dart';
import 'package:test/test.dart';

void main() {
  test('Given: Book class when: 인스턴스 생성 then: 타입 체크', () {
    // given
    Book book = Book(
      name: '플러터',
      price: 30000,
      color: 'brown',
      isbn: '12341234',
      weight: 0.3,
    );
    // when
    // then
    expect(book.weight, 0.3);

    expect(book is Book, true);
    expect(book is TangibleAsset, true);
    expect(book is Asset, true);
    expect(book is Thing, true); // 의외의 결과
  });
}
