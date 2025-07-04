import 'dart:convert';

import 'package:http/testing.dart';
import 'package:modu_3_dart_study/18_http/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../../mocks/mock_json_place_holder.dart';

void main() {
  test('getPost', () async {
    MockClient mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode({
          'id': 1,
          'title': 'test',
        }),
        200,
      );
    });

    RemoteDataSource dataSource = JsonPlaceHolderDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.getPost(1);
    expect(response.statusCode, 200);
  });
}
