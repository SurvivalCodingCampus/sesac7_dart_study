class Movie {
  String _title;
  String _director;
  int _year;

  // 생성자
  Movie({required String title, required String director, required int year})
    : _title = title,
      _director = director,
      _year = year;

  // getter
  String get title => _title;

  String get director => _director;

  int get year => _year;

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }

  // 역직렬화
  Movie.fromJson(Map<String, dynamic> json)
    : _title = json['title'],
      _director = json['director'],
      _year = json['year'];
}
