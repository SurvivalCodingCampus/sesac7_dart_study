import 'package:modu_3_dart_study/250703/model/album.dart';

abstract interface class AlbumDataSource {
  Future<List<Map<String, dynamic>>> getAlbums();
}
