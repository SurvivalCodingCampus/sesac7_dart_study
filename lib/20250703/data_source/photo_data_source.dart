
// 포토의 전체 데이터를 가져온다.
abstract interface class PhotoDataSource {
  Future<List<Map<String, dynamic>>> getAll();
}
