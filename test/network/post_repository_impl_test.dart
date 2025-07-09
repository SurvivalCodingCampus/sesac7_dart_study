import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source_impl.dart';
import 'package:modu_3_dart_study/18_http/repository/post_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('getPostsByKeyword Test', () async {
    // given (준비)

    MockClient mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode([
          {
            "userId": 1,
            "id": 1,
            "title":
                "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            "body":
                "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
          },
          {
            "userId": 1,
            "id": 2,
            "title": "qui est esse",
            "body":
                "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
          },
          {
            "userId": 1,
            "id": 3,
            "title":
                "ea molestias quasi exercitationem repellat qui ipsa sit aut",
            "body":
                "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
          },
        ]),
        200,
      );
    });

    RemoteDataSource dataSource = RemoteDataSourceImpl(client: mockClient);

    final repository = PostRepositoryImpl(dataSource);
    const keyword = 'exercitationem';

    // when (실행)
    final result = await repository.getPostsByKeyword(keyword);

    // then (검증)
    expect(result.length, 1);
    expect(result.every((post) => post.title.contains(keyword)), true);
  });
}
