import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/user2/user2_data_source.dart';
import 'package:modu_3_dart_study/dto/user2/user2_dto.dart';

class MockUser2DataSourceImpl implements User2DataSource {
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
    {
      "id": 3,
      "name": "Charlie Brown",
      "age": 22,
      "address": "789 Pine Ln, Nowhere",
      "phoneNumber": "555-111-2222",
    },
  ];
  final int statusCode;
  final Exception? exception;

  MockUser2DataSourceImpl({required this.statusCode, this.exception});

  @override
  Future<Response<User2Dto>> createUser(User2Dto user) async {
    if (exception != null) {
      throw exception!;
    }

    return Response(statusCode: statusCode, headers: {}, body: user);
  }

  @override
  Future<Response<List<User2Dto>>> getUsers() async {
    if (exception != null) {
      throw exception!;
    }

    return Response(
      statusCode: statusCode,
      headers: {},
      body: jsons.map(User2Dto.fromJson).toList(),
    );
  }
}
