import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/data_source/album/album_data_source.dart';
import 'package:modu_3_dart_study/data_source/album/album_data_source_impl.dart';
import 'package:modu_3_dart_study/model/album.dart';
import 'package:modu_3_dart_study/repository/album/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSourceImpl;

  AlbumRepositoryImpl({required AlbumDataSource albumDataSourceImpl})
    : _albumDataSourceImpl = albumDataSourceImpl;

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final List<Map<String, dynamic>> albumJsonList = await _albumDataSourceImpl
        .getAllAlbums();
    final List<Album> albums = albumJsonList
        .map((album) => Album.fromJson(album))
        .toList();

    if (limit != null) {
      if (limit > albums.length) {
        throw Exception('Album 전체 사이즈를 벗어남!');
      }
      return albums.slice(0, limit);
    } else {
      return albums;
    }
  }
}

void main() async {
  final albumDataSource = AlbumDataSourceImpl(filePath: 'json_data/albums.json');
  final albumRepository = AlbumRepositoryImpl(albumDataSourceImpl: albumDataSource);
  print(await albumRepository.getAlbums(limit: 4));
}
