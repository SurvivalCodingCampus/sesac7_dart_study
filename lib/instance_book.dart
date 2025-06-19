

class InstanceBook implements Comparable<InstanceBook> {
  String _title;
  DateTime _publishDate;
  String _comment;

  // 생성자
  InstanceBook({
    required String title,
    required String comment,
    DateTime? publishDate,
  }) : _publishDate = publishDate ?? DateTime.now(),
       _title = title,
       _comment = comment;

  // getter
  String get title => _title;

  DateTime get publishDate => _publishDate;

  String get comment => _comment;

  // setter
  set title(String title) => _title = title;

  set publishDate(DateTime publishDate) => _publishDate = publishDate;

  set comment(String comment) => _comment = comment;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceBook &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  // Book 클래스 복사를 위한 메소드
  InstanceBook copyWith({
    required String? title,
    required String? comment,
    DateTime? publishDate,
  }) {
    // publishDate에 null이 들어올 경우 this.publishDate를 가져오는 것이 아닌,
    // DateTime.now()를 통해 새 인스턴스를 인자로 주어 얕은 복사가 발생하지 않도록 함.
    return InstanceBook(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? DateTime.now(),
    );
  }

  @override
  int compareTo(InstanceBook other) {
    return -publishDate.compareTo(other.publishDate);
  }

  @override
  String toString() {
    return '책 이름: $title, 출간일: ${publishDate.year}-${publishDate.month}-${publishDate.day}, 코멘트: $comment';
  }
}
