

abstract interface class UserDataSource {
  Future<List<Map<String, dynamic>>> getUsers();
}
