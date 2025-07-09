import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/16_http/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/16_http/data_source/remote_data_source.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final baseUrl = 'https://jsonplaceholder.typicode.com';
  final testId = 1;
  final postToGet = {'id': 1, 'title': 'get post'};
  final postsToGet = [
    {'id': 1, 'title': 'get posts'},
  ];
  final postToCreate = {
    'userId': 1,
    'id': 1,
    'title': 'create post',
    'body': '',
  };
  final postToUpdate = {'id': 1, 'title': 'update post'};
  final postToPatch = {'id': 1, 'title': 'patch post'};
  final postToDelete = {};

  final MockClient mockClient = MockClient((request) async {
    if (request.method == 'GET' &&
        request.url.toString() == '$baseUrl/posts/$testId') {
      // getPost(id)
      return http.Response(
        jsonEncode(postToGet),
        200,
      );
    } else if (request.method == 'GET' &&
        request.url.toString() == '$baseUrl/posts') {
      // getPosts()
      return http.Response(
        jsonEncode(postsToGet),
        200,
      );
    } else if (request.method == 'POST' &&
        request.url.toString() == '$baseUrl/posts') {
      // createPost(post)
      return http.Response(
        jsonEncode(postToCreate),
        200,
      );
    } else if (request.method == 'PUT' &&
        request.url.toString() == '$baseUrl/posts/$testId') {
      // updatePost(id, post)
      return http.Response(
        jsonEncode(postToUpdate),
        200,
      );
    } else if (request.method == 'PATCH' &&
        request.url.toString() == '$baseUrl/posts/$testId') {
      // patchPost(id, post)
      return http.Response(
        jsonEncode(postToPatch),
        200,
      );
    } else if (request.method == 'DELETE' &&
        request.url.toString() == '$baseUrl/posts/$testId') {
      // deletePost(id)
      return http.Response(
        jsonEncode(postToDelete),
        200,
      );
    }
    return http.Response('Not Found', 404);
  });

  group('JsonPlaceHolderDataSource Test', () {
    RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );

    test('getPost(id) Test', () async {
      final response = await dataSource.getPost(1);
      expect(response.statusCode, 200);
      expect(response.body, postToGet);
    });

    test('getPosts() Test', () async {
      final response = await dataSource.getPosts();
      expect(response.statusCode, 200);
      expect(response.body, postsToGet);
    });

    test('createPost(post) Test', () async {
      final response = await dataSource.createPost(postToCreate);
      expect(response.statusCode, 200);
      expect(response.body, postToCreate);
    });

    test('updatePost(id, post) Test', () async {
      final response = await dataSource.updatePost(1, postToUpdate);
      expect(response.statusCode, 200);
      expect(response.body, postToUpdate);
    });

    test('patchPost(id, post) Test', () async {
      final response = await dataSource.patchPost(1, postToPatch);
      expect(response.statusCode, 200);
      expect(response.body, postToPatch);
    });

    test('deletePost(id) Test', () async {
      final response = await dataSource.deletePost(testId);
      expect(response.statusCode, 200);
    });
  });
}
