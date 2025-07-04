import 'package:modu_3_dart_study/assignments/repository_practice/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
