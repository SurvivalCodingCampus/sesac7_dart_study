import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/http_practice/data_source/json_place_holder_data_resource_impl.dart';
import 'package:modu_3_dart_study/assignments/http_practice/data_source/remote_data_source.dart';
import 'package:test/test.dart';

void main() {
  test('getPost 성공 테스트 ', () async {
    MockClient mockClient = MockClient((request) async {
      return http.Response(jsonEncode({'id': 1, 'title': 'test'}), 200);
    });

    RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );
    final response = await dataSource.getPost(postId: 1);
    expect(response.statusCode, 200);
  });

  test('getPost 성공 테스트 ', () async {
    MockClient mockClient = MockClient((request) async {
      return http.Response(jsonEncode({'id': 1, 'title': 'test'}), 201);
    });

    RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );
    final response = await dataSource.getPost(postId: 1);
    expect(response.statusCode, 201);
  });

  test('getPost 404', () {
    final mockClient = MockClient((request) async {
      return http.Response('Not Found', 404);
    });

    final dataSource = JsonPlaceHolderDataSourceImpl(client: mockClient);

    final response = dataSource.getPost(postId: 1);

    expect(response, throwsA(isA<Exception>()));
  });

  test('getPost 500', () {
    final mockClient = MockClient((request) async {
      return http.Response('Server Error', 500);
    });

    final dataSource = JsonPlaceHolderDataSourceImpl(client: mockClient);

    final response = dataSource.getPost(postId: 1);

    expect(response, throwsA(isA<Exception>()));
  });
}
