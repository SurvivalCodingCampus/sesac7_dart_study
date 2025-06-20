import 'package:collection/collection.dart';

class Book{ // comparable 사용 class Book implements Comparable<Book>
  String title;
  DateTime publishDate;
  String comment;

  // DateTime today = DateTime.now();
  // Static 으로 설정하고 사용할 수 없는 이유
  // Static 은 클래스 안에 고정되는거지 인스턴스 안에 고정되는 값이 아니다.
  // Static 은 이 클래스가 로드될때 한번 생성되는 값이 되어버림

  Book({
    required this.title, 
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now(); 
  // {
  //   // 생성될때 자동으로 리스트에 추가 + 정렬
  //   bookList.add(this);
  //   bookList.sort((a, b) => -a.publishDate.compareTo(b.publishDate));
  // }

  //: publishDate = publishDate ?? today;
  // 안되는 이유
  // 인스턴스가 안생겼는데 클래스의 필드 사용하려고 해서 클래스 내부에서 사용 불가
  // final todayDate = Book.publishDate.toString().substring(0,10);

  // copyWith()
  Book copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
  }){
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate
    );
  }

  @override
  String toString() {
    return 'Book(title: $title, publishDate: ${publishDate.toString()}, comment: $comment';
    // toIso8601String(): 국제표준형식의 문자열로 반환
  }

  // 제목과 출간일이 같으면 같은 책으로 판단한다
  // 연산자 재정의: 단일식을 리턴하는 간단한 함수 표현식
  @override
  bool operator ==(Object other) =>
    identical(this, other) || 
    other is Book && 
    title == other.title &&
    publishDate.toString().substring(0,10) == other.publishDate.toString().substring(0,10);
    // publishDate.year == other.publishDate.year &&
    // publishDate.month == other.publishDate.month &&
    // publishDate.day == other.publishDate.day;


  // hashcode 재정의
  @override
  int get hashCode => title.hashCode ^ publishDate.toString().substring(0,10).hashCode; 
  
  // Q. 시분초까지 붙은 publishDate 의 hashcode 와 equals 에서 재정의한 publishDate의 day까지만 보고 비교했을때 가능한 건가? 완전히 똑같이 재정의해줘야 의미가 있는건가?
  // A. 그렇다. 똑같은 규칙으로 재정의해줘야 의미가 있음

  // static List<Book> bookList(List<Book> books){
  //   books.sort((a, b) => a.publishDate.compareTo(b.publishDate));
  //   return books;
  // }

  // 정렬 함수: 출간일 기준 내림차순 정렬
  // Book class의 정적타입 메서드: 정적타입 메서드를 사용하는 이유
  // 인스턴스 생성 없이도 호출할 수 있기 때문에 Book.bookList
  
  // compareTo 이 방법도 작성해보기
  // @override
  // int compareTo(other){
    
  // }
  
}

// typedef Comparator<Book> = int Function(Book a, Book b);

// class dateComparator implements Comparator<Book> {
//   int compare(Book a, Book b) {
//     return a.publishDate.compareTo(b.publishDate);
//   }
// }


// 전역으로 전역 가변 상태 사용에 주의가 필요합니다.
// 전역 가변 리스트와 그를 수정하는 함수는 예측하기 어려운 사이드 이펙트를 발생시킬 수 있습니다.

// final List<Book> bookList = [];

// void bookListVoid () {
//   bookList.sort((a, b) => -a.publishDate.compareTo(b.publishDate));
// }

class SortBookList {
  final List<Book> _bookList = [];

  void add(Book book) {
    _bookList.add(book);
    _bookList.sorted((a, b) => -a.publishDate.compareTo(b.publishDate));
  }

  void clear() => _bookList.clear();

  List<Book> get books => _bookList;
}