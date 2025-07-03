import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/album.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _dataSource;

  AlbumRepositoryImpl(this._dataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    try {
      final List<Map<String, dynamic>> listOfAlbumMap = await _dataSource
          .getAll();
      if (limit == null) {
        return listOfAlbumMap.map((e) => Album.fromJson(e)).toList();
      } else {
        return listOfAlbumMap
            .map((e) => Album.fromJson(e))
            .toList()
            .sublist(
              0,
              listOfAlbumMap.length < limit ? listOfAlbumMap.length : limit,
            );
      }
    } catch (e) {
      return [];
    }
  }
}
