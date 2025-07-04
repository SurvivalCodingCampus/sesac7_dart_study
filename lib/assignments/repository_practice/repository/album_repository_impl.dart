import 'package:modu_3_dart_study/assignments/repository_practice/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/model/album.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _dataSource;

  AlbumRepositoryImpl(this._dataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    try {
      final allAlbums = (await _dataSource.getAll())
          .map((e) => Album.fromJson(e))
          .toList();

      // imit 을 지정하지 않으면 모든 데이터를
      // limit 을 지정하면 limit 갯수만큼
      
      return (limit is int)
          ? (allAlbums.sublist(0, ((limit > 0) ? limit : 0)))
          : allAlbums;
    } catch (e) {
      return [];
    }
  }
}
