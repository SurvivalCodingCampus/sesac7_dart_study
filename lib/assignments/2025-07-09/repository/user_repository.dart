import 'package:modu_3_dart_study/assignments/2025-07-09/core/network_error.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/core/registration_error.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/user_model.dart';

abstract interface class UserRepository {
  Future<Result<UserModel, NetworkError>> getUser(int id);

  Future<Result<List<UserModel>, NetworkError>> getUsers();

  Future<Result<UserModel, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
