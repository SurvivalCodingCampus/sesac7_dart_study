
// 해야할 일의 전체 데이터를 가져온다.
abstract interface class TodoDataSource {
  Future<List<Map<String, dynamic>>> getAll();
}
