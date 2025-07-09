import 'dart:convert';

import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/json_placeholder/post_data_source.dart';
import 'package:modu_3_dart_study/data_source/json_placeholder/post_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  final jsons = [
    {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    },
    {
      "userId": 2,
      "id": 2,
      "title": "qui est esse",
      "body":
          "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla",
    },
    {
      "userId": 3,
      "id": 3,
      "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
      "body":
          "et iusto sed quo iure voluptatem occaecati omnis eligendi aut ad voluptatem doloribus vel accusantium quis pariatur molestiae porro eius odio et labore et velit aut",
    },
  ];
  final succeededBody = jsonEncode(jsons[0]);
  final succeededStatusCode = 200;
  final failedBody = '';
  final failedStatusCode = 404;

  group(
    'createPost',
    () {
      test('createPost success', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(succeededBody, succeededStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.createPost(succeededBody);

        // then
        expect(response.statusCode, succeededStatusCode);
        expect(response.body, succeededBody);
      });

      test('createPost fail', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(failedBody, failedStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.createPost(failedBody);

        // then
        expect(response.statusCode, failedStatusCode);
        expect(response.body, failedBody);
      });
    },
  );

  group(
    'deletePost',
    () {
      test('deletePost success', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(succeededBody, succeededStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.deletePost(1);

        // then
        expect(response.statusCode, succeededStatusCode);
        expect(response.body, succeededBody);
      });

      test('deletePost fail', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(failedBody, failedStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.deletePost(1);

        // then
        expect(response.statusCode, failedStatusCode);
        expect(response.body, failedBody);
      });
    },
  );

  group(
    'getPost',
    () {
      test('getPost success', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(succeededBody, succeededStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.getPost(1);

        // then
        expect(response.statusCode, succeededStatusCode);
        expect(response.body, succeededBody);
      });

      test('getPost fail', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(failedBody, failedStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.getPost(1);

        // then
        expect(response.statusCode, failedStatusCode);
        expect(response.body, failedBody);
      });
    },
  );

  group(
    'getPosts',
    () {
      test('getPosts success', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(succeededBody, succeededStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.getPosts();

        // then
        expect(response.statusCode, succeededStatusCode);
        expect(response.body, succeededBody);
      });

      test('getPosts fail', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(failedBody, failedStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.getPosts();

        // then
        expect(response.statusCode, failedStatusCode);
        expect(response.body, failedBody);
      });
    },
  );

  group(
    'patchPost',
    () {
      test('patchPost success', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(succeededBody, succeededStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.patchPost(1, succeededBody);

        // then
        expect(response.statusCode, succeededStatusCode);
        expect(response.body, succeededBody);
      });

      test('patchPost fail', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(failedBody, failedStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.patchPost(1, failedBody);

        // then
        expect(response.statusCode, failedStatusCode);
        expect(response.body, failedBody);
      });
    },
  );

  group(
    'updatePost',
    () {
      test('updatePost success', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(succeededBody, succeededStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.updatePost(1, succeededBody);

        // then
        expect(response.statusCode, succeededStatusCode);
        expect(response.body, succeededBody);
      });

      test('updatePost fail', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(failedBody, failedStatusCode);
        });
        final PostDataSource dataSource = PostDataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSource.updatePost(1, failedBody);

        // then
        expect(response.statusCode, failedStatusCode);
        expect(response.body, failedBody);
      });
    },
  );
}
