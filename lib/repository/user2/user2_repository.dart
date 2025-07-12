import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/model/user2/user2.dart';

abstract interface class User2Repository {
  Future<Result<User2, NetworkError>> getUser(int id);
  Future<Result<List<User2>, NetworkError>> getUsers();
  Future<Result<User2, NetworkError>> createUser({
    required String name,
    required int age,
    required String address,
    required String phoneNumber,
  });
}
