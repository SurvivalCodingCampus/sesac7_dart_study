import 'package:modu_3_dart_study/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
