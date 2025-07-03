abstract interface class TodoDataSource{
  Future<List<Map<String,dynamic>>> getTodo();
  Future<List<Map<String,dynamic>>> getCompletedTodo();
}