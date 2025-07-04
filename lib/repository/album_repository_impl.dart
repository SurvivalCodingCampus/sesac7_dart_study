import 'package:modu_3_dart_study/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/model/album.dart';
import 'package:modu_3_dart_study/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _dataSource;

  AlbumRepositoryImpl({required AlbumDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    try {
      final jsons = await _dataSource.getAlbums();
      final albums = jsons.map(Album.fromJson).toList();
      return limit != null && limit < albums.length
          ? albums.sublist(0, limit)
          : albums;
    } catch (e) {
      return [];
    }
  }
}
