abstract interface class TodoDataSource {
  Future<List<Map<String, dynamic>>> getAll();
}
