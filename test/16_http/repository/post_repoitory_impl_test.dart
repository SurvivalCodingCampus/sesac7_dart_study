import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/16_http/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/16_http/model/post.dart';
import 'package:modu_3_dart_study/16_http/repository/post_repoitory_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_json_place_holder.dart';

void main() {
  final baseUrl = 'https://jsonplaceholder.typicode.com';
  final testId = 1;
  final MockClient mockClient = MockClient((request) async {
    if (request.method == 'GET' && request.url.toString() == '$baseUrl/posts') {
      // getPosts
      return http.Response(
        jsonEncode(posts),
        200,
      );
    }
    return http.Response('Not Found', 404);
  });

  final dataSource = JsonPlaceHolderDataSourceImpl(client: mockClient);
  final repository = PostRepositoryImpl(dataSource);

  test('PostRepositoryImpl class getPostsKeyword(keyword) Test', () async {
    final keyword = 'provident';
    final postsByKeyword = await repository.getPostsByKeyword(keyword);

    expect(
      postsByKeyword[0].title,
      posts
          .map((e) => Post.fromJson(e))
          .where((e) => e.title.contains(keyword))
          .first
          .title,
    );
  });
}
