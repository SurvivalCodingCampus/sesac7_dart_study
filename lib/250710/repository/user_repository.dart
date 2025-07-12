import 'dart:core';

import '../core/enums.dart';
import '../core/result.dart';
import '../model/user.dart';

abstract interface class UserRepository {
  //모든 메서드는 Result패턴 사용
  //네트어크 에러 처리 필수

  //사용자 ID로 단일 사용자 조회
  Future<Result<User, NetworkError>> getUser({required int id});

  //전체사용자 목록 조회
  Future<Result<List<User>, NetworkError>> getUsers();

  //새 사용자 생성
  Future<Result<User, NetworkError>> addUser({required User user});
}
