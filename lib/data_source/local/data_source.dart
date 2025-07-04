abstract interface class DataSource{
  Future<List<Map<String, dynamic>>> getAll();
}