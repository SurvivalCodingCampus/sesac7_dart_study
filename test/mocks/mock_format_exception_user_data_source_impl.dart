import 'dart:async';

import 'package:modu_3_dart_study/18_http/core/response.dart';
import 'package:modu_3_dart_study/20_result/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/20_result/dto/user_dto.dart';

class MockFormatExceptionUserDataSourceImpl implements UserDataSource {
  @override
  Future<Response<UserDto>> createUser(UserDto userDto) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Response<UserDto>> getUser(int id) async {
    throw FormatException('format exception');
  }

  @override
  Future<Response<List<UserDto>>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
