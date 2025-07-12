import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/dto/app_user_dto.dart';
import 'package:modu_3_dart_study/model/app_user.dart';

abstract interface class AppUserRepository {
  // Todo 사용자 ID 로 단일 사용자를 조회하는 메서드
  Future<Result<AppUser, NetworkError>> getUser(int userId);

  // Todo 전체 사용자 목록을 조회하는 메서드
  Future<Result<List, NetworkError>> getUserList();

  // Todo 새 사용자를 생성하는 메서드
  Future<Result<AppUserDto, NetworkError>> createUser(AppUser appUser);
}
