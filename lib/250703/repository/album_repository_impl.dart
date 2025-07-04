import 'package:modu_3_dart_study/250703/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/250703/model/album.dart';
import 'package:modu_3_dart_study/250703/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final albums = (await _albumDataSource.getAlbums())
        .map((e) => Album.fromJson(e))
        .toList();

    return limit == null ? albums : albums.take(limit).toList();
  }
}
