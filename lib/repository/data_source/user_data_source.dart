
abstract interface class UserDataSource {
  Future<List<Map<String,dynamic>>> getUsers();
  Future<List<Map<String,dynamic>>> getUsersTop10ByUserName();
}