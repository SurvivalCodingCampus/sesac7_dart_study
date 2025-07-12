import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/dto/user2/user2_dto.dart';

abstract interface class User2DataSource {
  Future<Response<List<User2Dto>>> getUsers();
  Future<Response<User2Dto>> createUser(User2Dto user);
}
