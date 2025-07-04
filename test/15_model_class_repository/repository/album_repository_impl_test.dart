import 'package:modu_3_dart_study/15_model_class_repository/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/album_repository.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/album_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_album_data_source_impl.dart';

void main() {
  group('AlbumRepositoryImpl Test', () {
    final AlbumDataSource dataSource = MockAlbumDataSourceImpl();
    final AlbumRepository repository = AlbumRepositoryImpl(dataSource);

    test('getAlbums() Test', () async {
      final albums = await repository.getAlbums(limit: 3);
      final allAlbums = await repository.getAlbums();
      final emptyAlbum = await repository.getAlbums(limit: -1);

      expect(albums.length, 3);
      expect(allAlbums.length, 10);
      expect(emptyAlbum.length, 0);
    });
  });
}
