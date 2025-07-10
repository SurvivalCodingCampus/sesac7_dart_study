import 'package:modu_3_dart_study/18_http/core/result.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/data_source/user_repository.dart';
import 'package:modu_3_dart_study/18_http/model/user.dart';

import '../dto/user_dto.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Result<UserDto>> getUserById(String id) async {
    final response = await _dataSource.getPost(id);

    return
  }

  @override
  Future<Result<List<UserDto>>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDto>> createUser() {
    // TODO: implement postUser
    throw UnimplementedError();
  }
}
