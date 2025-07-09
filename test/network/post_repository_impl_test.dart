import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source_impl.dart';
import 'package:modu_3_dart_study/18_http/repository/post_repository_impl.dart';
import 'package:test/test.dart';

import 'mock/mock_json_remote_data_source.dart';

void main() {
  test('getPostsByKeyword Test', () async {
    // given (준비)
    final mockPosts = posts;
    MockClient mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(mockPosts),
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
