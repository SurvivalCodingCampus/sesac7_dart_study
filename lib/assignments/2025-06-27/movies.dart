// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  String? title;
  String? director;
  int? year;

  Movie ({String? title, String? director, int? year});

  Movie.fromJson(Map<String, dynamic> json) : title = json['title'], director = json['director'], year = json['year'];

  Map<String, dynamic> toJson() {
    return {
      'title' : title,
      'director' : director,
      'year' : year
    };
  }
  

  Movie copyWith({
    String? title,
    String? director,
    int? year,
  }) {
    return Movie(
      title: title ?? this.title,
      director: director ?? this.director,
      year: year ?? this.year,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
    other is Movie && runtimeType == other.runtimeType &&
    title == other.title && director == other.director && year == other.year;
  }

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;

  @override
  String toString() => 'Movie(title: $title, director: $director, year: $year)';
}

Future<Movie> getMovieInfo() {
  // TODO : 2초간 기다리는 코드 작성

  // 서버에서 들어오는 데이터라고 상상

  final String jsonString = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }''';

  // TODO : Movie 데이터 클래스를 리턴하도록 작성
  return
}
