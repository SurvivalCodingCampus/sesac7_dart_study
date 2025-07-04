abstract interface class CompanyDataSource {
  Future<List<Map<String, dynamic>>> getAllUsers();

  Future<List<Map<String, dynamic>>> getAllUsersTop10ByUserName();
}
