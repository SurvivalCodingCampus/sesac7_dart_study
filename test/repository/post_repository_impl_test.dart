import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:modu_3_dart_study/repository/post_repository_impl.dart';
import 'package:modu_3_dart_study/data_source/remote/json_place_holder_data_source_impl.dart';

void main() {
  test('실제 api 호출이 정상적으로 작동한다 ', () async {
    final dataSource = JsonPlaceHolderDataSourceImpl(
      baseUrl: 'http://jsonplaceholder.typicode.com',
    );
    final response = await dataSource.getPosts();

    expect(response.statusCode, 200);
  });

  test('실제 호출된 api에서 title에 특정 keyword 가 있는 결과를 확인 할 수 있다', () async {
    final dataSource = JsonPlaceHolderDataSourceImpl(
      baseUrl: 'http://jsonplaceholder.typicode.com',
    );
    final repository = PostRepositoryImpl(dataSource);

    final testKeyWord = 'vel';
    final results = await repository.getPostsByKeyword(testKeyWord);

    expect(results.isNotEmpty, true);
    expect(results.first.title.toLowerCase().contains(testKeyWord), true);
  });
}
