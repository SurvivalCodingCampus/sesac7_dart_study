abstract interface class AlbumDataSource {
  Future<List<Map<String, dynamic>>> getAlbums();
}
