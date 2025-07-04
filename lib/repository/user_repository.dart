
import 'package:modu_3_dart_study/model/user.dart';

abstract interface class UserRepository{
  Future<List<User>> getUsers(num id);
  Future<List<User>> getUsersTop10ByUserName();
}