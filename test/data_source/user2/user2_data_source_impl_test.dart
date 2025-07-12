import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/data_source/user2/user2_data_source.dart';
import 'package:modu_3_dart_study/data_source/user2/user2_data_source_impl.dart';
import 'package:modu_3_dart_study/dto/user2/user2_dto.dart';
import 'package:test/test.dart';

void main() {
  final jsons = [
    {
      "id": 1,
      "name": "Alice Smith",
      "age": 28,
      "address": "123 Maple St, Anytown",
      "phoneNumber": "555-123-4567",
    },
    {
      "id": 2,
      "name": "Bob Johnson",
      "age": 34,
      "address": "456 Oak Ave, Somewhere",
      "phoneNumber": "555-987-6543",
    },
  ];
  final successBody = jsonEncode(jsons[0]);
  final successStatusCode = 200;
  final failedBody = '{}';
  final failedStatusCode = 404;
  final userDto = User2Dto.fromJson(jsons[0]);

  group(
    'createUser',
    () {
      test('success', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(successBody, successStatusCode);
        });
        final User2DataSource dataSouce = User2DataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSouce.createUser(userDto);

        // then
        expect(response.statusCode, successStatusCode);
        expect(response.body.id, userDto.id);
      });

      test('failed', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(failedBody, failedStatusCode);
        });
        final User2DataSource dataSouce = User2DataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSouce.createUser(userDto);

        // then
        expect(response.statusCode, failedStatusCode);
      });
    },
  );

  group(
    'getUsers',
    () {
      test('success', () async {
        // given
        final expectedLength = 2;
        final mockClient = MockClient((request) async {
          return http.Response(jsonEncode(jsons), successStatusCode);
        });
        final User2DataSource dataSouce = User2DataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSouce.getUsers();

        // then
        expect(response.statusCode, successStatusCode);
        expect(response.body.length, expectedLength);
      });

      test('failed', () async {
        // given
        final mockClient = MockClient((request) async {
          return http.Response(jsonEncode(jsons), failedStatusCode);
        });
        final User2DataSource dataSouce = User2DataSourceImpl(
          client: mockClient,
        );

        // when
        final response = await dataSouce.getUsers();

        // then
        expect(response.statusCode, failedStatusCode);
      });
    },
  );
}
