import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-07-04/core/res.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/json_placeholder_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/remote_data_source.dart';
import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'mocks/mock_json_photo.dart';

void main() {
  test('getPhoto()', () async {
    MockClient mockClient = MockClient((request) async {
      return http.Response(jsonEncode(photos[1]), 200);
    });

    RemoteDataSource dataSource = JsonPlaceholderSourceImpl(client: mockClient);

    final Res res = await dataSource.getPhoto(1);
    expect(res.statusCode, 200);
  });

  test('getPhotos()', () async {
    MockClient mockClient = MockClient((request) async {
      return http.Response(jsonEncode(photos), 200);
    });

    RemoteDataSource dataSource = JsonPlaceholderSourceImpl(client: mockClient);

    final Res res = await dataSource.getPhotos();
    expect(res.statusCode, 200);
  });
}
