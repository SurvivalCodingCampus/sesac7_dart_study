import 'package:test/test.dart';
import 'package:modu_3_dart_study/get_movie_info.dart';

void main() {
  test('jsonString 이 List 인 경우 첫번째 값에서 title 을 출력할 수 있다', () async {
    
    final listTypeJson = '''
      [
        {
          "title": "Star Ward",
          "director": "George Lucas",
          "year": 1977
        },
        {
          "title": "Star Ward2",
          "director": "George Lucas",
          "year": 1978
        }
      ]
      ''';
    
    // getMovieInfo 는 Future 타입이라서 미래에 객체가 될 예정인 것
    final result = await getMovieInfo(listTypeJson);
    
    expect(result[0].title, equals('Star Ward'));
  });

  test('jsonString 이 Map 인 경우 Movie 객체의 title을 출력할 수 있다', () async {
    
    final listTypeJson = '''
      {
        "title": "Star Ward",
        "director": "George Lucas",
        "year": 1977
      }
    ''';

    final result = await getMovieInfo(listTypeJson);
    
    expect(result.title, equals('Star Ward'));
  });
    
}