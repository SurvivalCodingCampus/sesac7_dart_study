abstract interface class PhotoDataSource {
  // Future<List<Map<String, dynamic>>> getAllData();
  Future<List<Map<String, Object?>>> getAllData();
}
