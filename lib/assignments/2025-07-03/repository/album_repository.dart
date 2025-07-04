import 'package:modu_3_dart_study/assignments/2025-07-03/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
