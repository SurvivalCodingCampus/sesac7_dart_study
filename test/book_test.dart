// ignore: deprecated_member_use
import 'package:collection/equality.dart';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/book.dart';

void main () {

  // 컬렉션 라이브러리 첫 페이지 참고해서 testcode 작성

  // 인스턴스가 생성되면서 자동으로 bookList 안에 담긴다
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day); // day 까지만 확인한다

  final bookList = SortBookList();

  test('제목과 출간일이 같으면 같은 책으로 판단하지만 같은 인스턴스는 아니다', (){
        
    // 테스트 날짜 당일이면서 시간만 다르게 표기  
    Book book1 = Book(title: 'book01', comment: 'book1 comment', publishDate: now);
    Book book2 = Book(title: 'book01', comment: 'book2 comment', publishDate: today);

    // title 과 publishDate 가 day까지 같으면 같은 책이라고 판단한다
    expect(book1 == book2, true);

    // 비교하는 두가지 인스턴스는 다른 hashcode 를 가진다
    expect(book1.hashCode == book2.hashCode, false);

    // 참조가 다르다 (같은 내용이지만 서로 다른 인스턴스)
    expect(
      const SetEquality(IdentityEquality()).equals({book1}, {book2}), false
    );
  });

  test('제목과 출간일이 같은 각 인스턴스의 제목과 출간일의 hashcode는 같다', (){
    Book book3 = Book(title: '이름이같은책', comment: 'book3 comment', publishDate: now);
    Book book4 = Book(title: '이름이같은책', comment: 'book4 comment', publishDate: today);

    bookList.add(book3);
    bookList.add(book4);

    // 제목과 출간일의 hashcode 는 같다
    expect(book3.title.hashCode == book4.title.hashCode, true);
    expect(book3.publishDate.year.hashCode == book4.publishDate.year.hashCode, true);
    expect(book3.publishDate.month.hashCode == book4.publishDate.month.hashCode, true);
    expect(book3.publishDate.day.hashCode == book4.publishDate.day.hashCode, true);

  });

  test('Book 인스턴스를 담고있는 리스트는 출간일이 신상순으로 정렬된다',(){

    // 테스트 하는 날짜에서 1,2일한 값
    Book book5 = Book(title: 'book5', comment: 'book5 comment', publishDate: today.add(Duration(days: 1)));
    Book book6 = Book(title: 'book6', comment: 'book6 comment', publishDate: today.subtract(Duration(days: 2)));
    Book book7 = Book(title: 'book7', comment: 'book7 comment', publishDate: today);

    bookList.clear();

    bookList.add(book5);
    bookList.add(book6);
    bookList.add(book7);

    print(bookList);

    expect(bookList.books.first, equals(book5));
    expect(bookList.books.last, equals(book6));
  });

  test('copyWith: 동일한 값으로 복사하고 참조는 다르다',(){
    Book book8 = Book(title: 'book8', comment: 'book8 comment', publishDate: today);
    Book book9 = book8.copyWith();

    // hashcode 값은 같지만 참조 주소는 다르다를 확인해야함

    // expect(SetEquality(IdentityEquality(book8, book9)), true);
    expect(identical(book8, book9), false);
  });

  test('copyWith: 일부값만 변경가능하다',(){
    Book book10 = Book(title: 'book10', comment: 'book10 comment', publishDate: today);
    Book book11 = book10.copyWith(title: 'book11');

    expect(book11.comment, equals('book10 comment'));
  });
}
