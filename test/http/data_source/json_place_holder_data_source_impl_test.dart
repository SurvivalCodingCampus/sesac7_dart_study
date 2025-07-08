import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/http/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/http/reponse.dart';
import 'package:test/test.dart';

import '../../model_class_repository/mocks/mock_json_place_holder.dart';

void main() {
  final List<Map<String, dynamic>> mockPosts = MockJsonPlaceHolder().data;

  group('JsonPlaceHolderDataSourceImpl Test', () {
    test('getPosts success: 200', () async {
      // given

      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode(mockPosts),
          200,
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when
      final Response<List<Map<String, dynamic>>> response = await dataSource
          .getPosts();

      // then
      expect(response.statusCode, 200);
      expect(response.body, isA<List<Map<String, dynamic>>>());
      expect(response.body.length, mockPosts.length);
      expect(response.body[0]['id'], mockPosts[0]['id']);
    });

    test('getPosts failure: 500', () async {
      // given
      final int errorCode = 500;
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode(mockPosts),
          errorCode,
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when
      final Response<List<Map<String, dynamic>>> result = await dataSource
          .getPosts();

      // then
      expect(result.statusCode, equals(errorCode));
    });

    test('getPosts failure: 잘못된 형식', () async {
      // given
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({'error': 'Not a list'}),
          200,
          headers: {'Content-Type': 'application/json'},
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      final Response<List<Map<String, dynamic>>> result = await dataSource
          .getPosts();

      // when & then
      expect(result.statusCode, equals(200));
      // expect(result.body,)
    });

    test('getPost success: 200', () async {
      // given
      final Map<String, dynamic> mockPost = mockPosts[0];

      final int successCode = 200;
      final int testId = 1;
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode(mockPost),
          successCode,
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when
      final Response<Map<String, dynamic>> response = await dataSource.getPost(
        testId,
      );

      // then
      expect(response.statusCode, successCode);
      expect(response.body, isA<Map<String, dynamic>>());
      expect(response.body['id'], mockPost['id']);
      expect(response.body['title'], mockPost['title']);
    });

    test('getPost failure: 404', () async {
      // given
      final int errorCode = 404;
      final int errorId = 999;
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode(mockPosts),
          errorCode,
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      final result = await dataSource.getPost(errorId);

      // when & then
      print(result);
    });

    test('createPost success: 201', () async {
      // given
      final Map<String, dynamic> newPostData = MockJsonPlaceHolder().data[0];
      final Map<String, dynamic> createdPostResponse = {
        'id': 5,
        ...newPostData,
      };

      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode(createdPostResponse),
          201,
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when
      final Response<Map<String, dynamic>> response = await dataSource
          .createPost(newPostData);

      // then
      expect(response.statusCode, 201);
      expect(response.body, isA<Map<String, dynamic>>());
      expect(response.body['id'], 5);
      expect(response.body['title'], 'nesciunt quas odio');
    });

    test('createPost failure: 400', () async {
      // given
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          'Bad Request',
          400,
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when & then
      expectLater(
        () => dataSource.createPost({'invalid_data': 'test'}),
        throwsA(isA<Exception>()),
      );
    });

    test('updatePost success: 200', () async {
      // given
      final Map<String, dynamic> updatedPostData = {
        'id': 1,
        'userId': 1,
        'title': 'Updated Title',
        'body': 'Updated Body',
      };

      final MockClient mockClient = MockClient((request) async {
        if (request.method == 'PUT' && request.url.pathSegments.last == '1') {
          return http.Response(
            jsonEncode(updatedPostData),
            200,
            headers: {'Content-Type': 'application/json'},
          );
        }
        return http.Response('Not Found', 404);
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when
      final Response<Map<String, dynamic>> response = await dataSource
          .updatePost(1, updatedPostData);

      // then
      expect(response.statusCode, 200);
      expect(response.body, isA<Map<String, dynamic>>());
      expect(response.body['title'], 'Updated Title');
    });

    test('updatePost failure: 404', () async {
      // given
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          'Not Found',
          404,
          headers: {'Content-Type': 'text/plain'},
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when & then
      expectLater(
        () => dataSource.updatePost(999, {'title': 'fail'}),
        throwsA(isA<Exception>()),
      );
    });

    test('patchPost success: 200', () async {
      // given
      final Map<String, dynamic> patchData = {
        'title': 'Patched Title',
      };
      final Map<String, dynamic> patchedPostResponse = {
        'id': 1,
        'userId': 1,
        'title': 'Patched Title',
        'body': 'Original Body',
      };

      final MockClient mockClient = MockClient((request) async {
        if (request.method == 'PATCH' && request.url.pathSegments.last == '1') {
          return http.Response(
            jsonEncode(patchedPostResponse),
            200,
            headers: {'Content-Type': 'application/json'},
          );
        }
        return http.Response('Not Found', 404);
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when
      final Response<Map<String, dynamic>> response = await dataSource
          .patchPost(1, patchData);

      // then
      expect(response.statusCode, 200);
      expect(response.body, isA<Map<String, dynamic>>());
      expect(response.body['title'], 'Patched Title');
    });

    test('patchPost failure: 404', () async {
      // given
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          'Not Found',
          404,
          headers: {'Content-Type': 'text/plain'},
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when & then
      expectLater(
        () => dataSource.patchPost(999, {'title': 'fail'}),
        throwsA(isA<Exception>()),
      );
    });

    test('deletePost success: 200', () async {
      // given
      final MockClient mockClient = MockClient((request) async {
        if (request.method == 'DELETE' &&
            request.url.pathSegments.last == '1') {
          return http.Response(
            '',
            200,
            headers: {'Content-Type': 'application/json'},
          );
        }
        return http.Response('Not Found', 404);
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when
      final Response<void> response = await dataSource.deletePost(1);

      // then
      expect(response.statusCode, 200);
      // expect(response.body, isNull);
    });

    test('deletePost failure: 404', () async {
      // given
      final MockClient mockClient = MockClient((request) async {
        return http.Response(
          'Not Found',
          404,
          headers: {'Content-Type': 'text/plain'},
        );
      });

      final RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
        client: mockClient,
      );

      // when & then
      expectLater(
        () => dataSource.deletePost(999),
        throwsA(isA<Exception>()),
      );
    });
  });
}
