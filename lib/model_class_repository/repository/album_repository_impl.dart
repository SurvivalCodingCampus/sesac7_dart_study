import 'package:modu_3_dart_study/model_class_repository/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/model/album.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  const AlbumRepositoryImpl({required AlbumDataSource albumDataSource})
    : _albumDataSource = albumDataSource;

  @override
  Future<List<Album>> getAlbums(int? limit) async {
    final listOfAlbums = await _albumDataSource.getAll();

    if (limit == null) {
      return listOfAlbums.map((e) => Album.fromJson(e)).toList();
    } else {
      final result = [];
      for (int i = 0; i < limit; i++) {
        result.add(listOfAlbums[i]);
      }

      return result.map((e) => Album.fromJson(e)).toList();
    }
  }
}
