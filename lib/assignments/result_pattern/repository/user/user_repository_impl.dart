import 'package:modu_3_dart_study/assignments/result_pattern/core/network_error.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/core/result.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/dto/user_dto.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/model/user.dart';
import 'package:modu_3_dart_study/assignments/result_pattern/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Result<List<User>, NetworkError>> getUsers() async {
    try {
      final response = await _userDataSource.getUsers();
      final statusCode = response.statusCode;
      final users = response.body.map((data) => data.toModel()).toList();

      switch (statusCode) {
        case 200:
          return Result.success(users);
        case 401:
          return Result.error(NetworkError.unauthorized);
        case 404:
          return Result.error(NetworkError.notFound);
        case 504:
          return Result.error(NetworkError.requestTimeout);
        default:
          return Result.error(NetworkError.unknown);
      }
    } catch (_) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUserId(int id) async {
    try {
      final response = await _userDataSource.getUserId(id);
      final statusCode = response.statusCode;
      final user = response.body.toModel();

      switch (statusCode) {
        case 200:
          return Result.success(user);
        case 401:
          return Result.error(NetworkError.unauthorized);
        case 404:
          return Result.error(NetworkError.notFound);
        case 504:
          return Result.error(NetworkError.requestTimeout);
        default:
          return Result.error(NetworkError.unknown);
      }
    } catch (_) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<String, NetworkError>> createUser(UserDto dto) async {
    try {
      final response = await _userDataSource.createUser(dto);
      final statusCode = response.statusCode;

      switch (statusCode) {
        case 200:
          return Result.success('${dto.name} 유저 생성');
        case 401:
          return Result.error(NetworkError.unauthorized);
        case 404:
          return Result.error(NetworkError.notFound);
        case 504:
          return Result.error(NetworkError.requestTimeout);
        default:
          return Result.error(NetworkError.unknown);
      }
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (_) {
      return Result.error(NetworkError.unknown);
    }
  }
}
