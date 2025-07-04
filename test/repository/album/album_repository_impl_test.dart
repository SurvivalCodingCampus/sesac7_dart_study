import 'package:modu_3_dart_study/data_source/album/album_data_source.dart';
import 'package:modu_3_dart_study/model/album.dart';
import 'package:modu_3_dart_study/repository/album/album_repository.dart';
import 'package:modu_3_dart_study/repository/album/album_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_album_data_source_impl.dart';

void main() {
  group('AlbumRepositoryImpl Test', () {
    test('getAlbums test', () async {
      final AlbumDataSource mockAlbumDataSourceImpl = MockAlbumDataSourceImpl();
      final AlbumRepository albumRepository = AlbumRepositoryImpl(albumDataSourceImpl: mockAlbumDataSourceImpl);
      final List<Album> albums = await albumRepository.getAlbums();

      expect(albums.length, equals(10));
      expect(albums.first.userId, equals(1));
      expect(albums.first.id, equals(1));
      expect(albums.first.title, equals('quidem molestiae enim'));
    });
    test('getAlbums parameter limit test', () async {
      final AlbumDataSource mockAlbumDataSourceImpl = MockAlbumDataSourceImpl();
      final AlbumRepository albumRepository = AlbumRepositoryImpl(albumDataSourceImpl: mockAlbumDataSourceImpl);
      final int totalAlbumSize = (await albumRepository.getAlbums()).length;

      for (int i = 0; i < totalAlbumSize; i++) {
        final limitedAlbums = await albumRepository.getAlbums(limit: i);
        expect(limitedAlbums.length, equals(i));
      }
    });
    test('getAlbums parameter limit 전체 앨범 범위 벗어나면 exception 발생 테스트', () async {
      final AlbumDataSource mockAlbumDataSourceImpl = MockAlbumDataSourceImpl();
      final AlbumRepository albumRepository = AlbumRepositoryImpl(albumDataSourceImpl: mockAlbumDataSourceImpl);
      final int totalAlbumSize = (await albumRepository.getAlbums()).length;

      expect(() async => await albumRepository.getAlbums(limit: totalAlbumSize + 1), throwsException);
    });
  });
}