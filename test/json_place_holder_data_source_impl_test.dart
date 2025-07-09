import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/model/post.dart';
import 'package:test/test.dart';

import 'mocks/mock_json_place_holder_post.dart';

void main() {
  test('getPosts', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(mockPosts),
        200,
      );
    });

    final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.getPosts();
    final List<Post> posts = response.body
        .map((e) => Post.fromJson(e))
        .toList();
    expect(response.statusCode, 200);
    expect(posts.length, 3);
  });

  test('getPost by id', () async {
    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(mockPosts[0]), 200);
    });

    final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.getPost(1);
    expect(response.statusCode, 200);
    expect(
      response.body['title'],
      'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
    );
  });

  test('createPost', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode({
          "userId": 1,
          "id": 4,
          "title": "created",
          "body": "created",
        }),
        200,
      );
    });

    final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.createPost({
      "userId": 1,
      "id": 4,
      "title": "created",
      "body": "created",
    });
    expect(response.statusCode, 200);
    expect(response.body, {
      "userId": 1,
      "id": 4,
      "title": "created",
      "body": "created",
    });
  });

  test('patchPost', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode({
          "userId": 1,
          "id": 4,
          "title": "created",
          "body": 'patched',
        }),
        200,
      );
    });

    final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.patchPost(4, {"body": 'patched'});
    expect(response.statusCode, 200);
    expect(
      response.body,
      {
        "userId": 1,
        "id": 4,
        "title": "created",
        "body": 'patched',
      },
    );
  });
}
