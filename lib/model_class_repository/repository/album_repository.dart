import 'package:modu_3_dart_study/model_class_repository/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
