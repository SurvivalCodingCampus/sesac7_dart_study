import 'package:modu_3_dart_study/model_class_repository/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/album_repository.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/album_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_album_data_source_impl.dart';

void main() {
  test('limit을 지정하지 않았을 경우 모든 앨범을 반환하는가?', () async {
    // given
    final int givenLength = 17;
    final AlbumDataSource albumDataSource = MockAlbumDataSourceImpl();
    final AlbumRepository albumRepository = AlbumRepositoryImpl(
      albumDataSource: albumDataSource,
    );

    // when
    final result = await albumRepository.getAlbums();

    // then
    expect(result.length, equals(givenLength));
  });

  test('limit을 지정할 경우 지정한 개수만큼 앨범을 반환하는가?', () async {
    // given
    final int testLength = 7;
    final AlbumDataSource albumDataSource = MockAlbumDataSourceImpl();
    final AlbumRepository albumRepository = AlbumRepositoryImpl(
      albumDataSource: albumDataSource,
    );

    // when
    final result = await albumRepository.getAlbums(limit: testLength);

    // then
    expect(result.length, equals(testLength));
  });
}
