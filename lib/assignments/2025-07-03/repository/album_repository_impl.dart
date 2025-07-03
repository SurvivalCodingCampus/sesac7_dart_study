import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/album.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final List<Map<String, dynamic>> albumsMapList = await _albumDataSource
        .getAllAlbums();
    final List<Album> albums = albumsMapList
        .map((map) => Album.fromJson(map))
        .toList();
    return limit != null && limit <= albums.length
        ? albums.sublist(0, limit)
        : albums;
  }
}
