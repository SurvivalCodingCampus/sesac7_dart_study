import 'package:modu_3_dart_study/assignments/repository_practice/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/album_repository.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/album_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_album_data_source_impl.dart';

void main() {
  group('AlbumRepositoryImpl 테스트', () {
    final AlbumDataSource dataSource = MockAlbumDataSourceImpl();
    final AlbumRepository repository = AlbumRepositoryImpl(dataSource);

    test('Album limit 테스트', () async {
      final albumlist1 = await repository.getAlbums(limit: 6);
      final albumlist2 = await repository.getAlbums(limit: 8);

      expect(albumlist1.length, 6);
      expect(albumlist2.length, 8);
    });

    test('Album 10 반환 테스트 ', () async {
      final albums = await repository.getAlbums();

      expect(albums.length, 10);
    });
  });
}
