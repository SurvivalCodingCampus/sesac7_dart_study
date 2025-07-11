import 'dart:async';

import 'package:modu_3_dart_study/18_http/core/response.dart';
import 'package:modu_3_dart_study/20_result/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/20_result/dto/user_dto.dart';

class MockStatusCodeUserDataSourceImpl implements UserDataSource {
  @override
  Future<Response<UserDto>> createUser(UserDto userDto) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Response<UserDto>> getUser(int id) async {
    return Response(
      statusCode: id,
      header: {},
      body: UserDto(id: 200, name: '200', email: '200'),
    );
  }

  @override
  Future<Response<List<UserDto>>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
