import 'package:modu_3_dart_study/model/album.dart';

abstract interface class AlbumDataSource {
  Future<List<Album>> getAllAlbums();
}