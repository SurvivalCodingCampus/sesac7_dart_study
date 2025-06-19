/*
다음 동작을 할 수 있도록 Book 클래스를 수정하시오.
01. 제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다
02. Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.
03. copyWith() 메서드를 제공한다 (깊은복사)
*/

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  // 동등성 비교 재정의
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book && title == other.title && publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ comment.hashCode ^ publishDate.hashCode;

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }

  // copyWith 메서드 구현
  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }
}

void main() {}
