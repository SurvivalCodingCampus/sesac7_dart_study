abstract interface class ToDoDataSource {
  Future<List<Map<String, dynamic>>> getAll();
}
