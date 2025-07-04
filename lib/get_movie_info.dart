import 'dart:convert';

class Movie{
  String title;
  String director;
  num year;

  Movie.fromJson(Map<String, dynamic> map)
    : title = (map['title'] ?? ''),
      director = (map['director'] ?? ''),
      year = (map['year'] ?? 0);

  Movie(this.title, this.director, this.year);

  @override
  String toString() => 'Movie(title: $title, director: $director, year: $year)';
}

Future<dynamic> getMovieInfo(json) async{
  await Future.delayed(Duration(seconds: 2));

  final dynamic jsonString = jsonDecode(json);

  if (jsonString is List) {
    final List<dynamic> movies = jsonString; //List<Map<String, dynamic>>
    // final Movie movieList = Movie.fromJson(movies);
    final List<Movie> movieList = movies
      .map((item) => Movie.fromJson(item))
      .toList();

    return movieList;
  } else if (jsonString is Map<String, dynamic>) {
    final Map<String, dynamic> movies = jsonString;
    final movieList = Movie.fromJson(movies);

    return movieList;
  } else {
    throw FormatException('jsonString Type Error');
  }

  // hashcode 동일
  
  // copyWith 왜 작성하는가?
  // 객체지향의 필드는 final 로 불변객체로 활용해 안정성을 높인다
  // 불변성 유지 : 원본 데이터를 건드리지 않고 새로운 객체를 만들어 사용
  // 효율적 업데이트 : 필드하나만 바꿔도 전체 객체를 바꿀 필요없이 간단하게 복사 가능
  // 객체의 일부 값만 변경된 새로운 인스턴스를 만들어주기 때문에 불변성을 유지하면서도 효율적으로 업데이트 할 수 있음

  // test 할때 copyWith identical == false, 그냥 == true
}

void main() {
  // getMovieInfo();
}