
import 'package:modu_3_dart_study/20250703/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/20250703/model/album.dart';
import 'package:modu_3_dart_study/20250703/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository{
  final AlbumDataSource _albumDataSource;
  
  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    try {
      final result = await _albumDataSource.getAllData();
      if(limit == null || limit <= 0) {
        return result
            .map((e) => Album.fromJson(e)).toList();
      } else {
        return result
            .map((e) => Album.fromJson(e))
            .toList().sublist(0, limit);
      }
    } catch (e) {
      return [];
    }
  }
}
