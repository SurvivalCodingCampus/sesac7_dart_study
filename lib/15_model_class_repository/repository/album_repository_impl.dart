import 'package:modu_3_dart_study/15_model_class_repository/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/model/album.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _dataSource;

  AlbumRepositoryImpl(this._dataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    try {
      final allAlbums = (await _dataSource.getAll())
          .map((e) => Album.fromJson(e))
          .toList();

      return (limit is int)
          ? (allAlbums.sublist(0, ((limit > 0) ? limit : 0)))
          : allAlbums;
    } catch (e) {
      return [];
    }
  }
}
