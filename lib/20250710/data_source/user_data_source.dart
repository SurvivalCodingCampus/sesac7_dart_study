import 'package:http/http.dart';

abstract interface class UserDataSource {
  Future<Response> getUsers();
  Future<Response> getUser(int id);
  Future<Response> createUser(Map<String, dynamic> post);
}