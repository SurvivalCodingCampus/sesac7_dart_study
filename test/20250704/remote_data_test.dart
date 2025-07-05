import 'dart:convert';

import 'package:modu_3_dart_study/20250704/data_source/post_repository_impl.dart';
import 'package:modu_3_dart_study/20250704/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/20250704/data_source/remote_data_source_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../mocks/mock_remote_data.dart';

void main() {
  group('mock client 테스트', () {
    setUp(() {});
    test('createPost 정상테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({
          "userId": 100,
          "id": 101,
          "title": "test",
          "body": "test"
        }), 200);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.createPost({
        "userId": 100,
        "id": 101,
        "title": "test",
        "body": "test"
      });
      expect(response.statusCode, 200);
      expect(response.body, {
        "userId": 100,
        "id": 101,
        "title": "test",
        "body": "test"
      });
    });

    test('createPost error 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({'error': 'page not found!'}), 404);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.createPost({
        "userId": 100,
        "id": 101,
        "title": "test",
        "body": "test"
      });
      expect(response.statusCode, 404);
      expect(response.body, {'error': 'page not found!'});
    });

    test('getPost 정상테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({
          "userId": 1,
          "id": 1,
          "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        }), 200);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.getPost(1);
      expect(response.statusCode, 200);
      expect(response.body, {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      });
    });

    test('getPost error 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({'error': 'page not found!'}), 404);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.getPost(1);
      expect(response.statusCode, 404);
      expect(response.body, {'error': 'page not found!'});
    });

    test('getPosts 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode(posts), 200);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.getPosts();
      expect(response.statusCode, 200);
      expect(response.body, jsonEncode(posts));
    });

    test('getPosts 에러 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response('page not found!', 404);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.getPosts();
      expect(response.statusCode, 404);
      expect(response.body, 'page not found!');
    });

    test('patchPost 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode(posts), 200);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.patchPost(1, {
        "userId": 200,
        "title": "test",
      });
      expect(response.statusCode, 200);
      expect(
        response.body,
        jsonEncode(posts),
      );
    });

    test('patchPost 에러 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response('page not found!', 404);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.patchPost(1, {
        "userId": 200,
        "title": "test",
      });
      expect(response.statusCode, 404);
      expect(response.body, 'page not found!');
    });

    test('deletePost 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({}), 200);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.deletePost(1);
      expect(response.statusCode, 200);
    });

    test('deletePost error 테스트', () async {
      final mockClient = MockClient((request) async {
        return http.Response('DB Error!!!', 500);
      });

      final RemoteDataSource dataSource = RemoteDataSourceImpl(
        client: mockClient,
      );

      final response = await dataSource.deletePost(1);
      expect(response.statusCode, 500);
      expect(response.body, 'DB Error!!!');
    });

    test('PostRepositoryImpl 클래스 구현에 대한 테스트', () async {
      final postRepositoryImpl = PostRepositoryImpl(
        remoteDataSource: RemoteDataSourceImpl(),
      );
      final dataList = await postRepositoryImpl.getPostsByKeyword('voluptate');

      expect(dataList.length, 13);
      expect(dataList.first.title, 'voluptatem eligendi optio');
    });
  });
}
