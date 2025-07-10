import 'package:modu_3_dart_study/18_http/core/result.dart';

import '../dto/user_dto.dart';

abstract interface class UserRepository {
  // TODO: 사용자 ID로 단일 사용자를 조회하는 메서드
  Future<Result<UserDto>> getUserById(String id);

  // TODO: 전체 사용자 목록을 조회하는 메서드
  Future<Result<List<UserDto>>> getUsers();

  // TODO: 새 사용자를 생성하는 메서드
  Future<Result<UserDto>> createUser();
}
