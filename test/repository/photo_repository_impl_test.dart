import 'package:modu_3_dart_study/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/repository/photo_repository.dart';
import 'package:modu_3_dart_study/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_photo_data_source_impl.dart';

void main() {
  final PhotoDataSource dataSource = MockPhotoDataSourceImpl();
  final PhotoRepository repository = PhotoRepositoryImpl(
    dataSource: dataSource,
  );

  group('getPhotos', () {
    test(
      'When albumId is 1, the length of the getPhotos result is 1.',
      () async {
        // given
        final albumId = 1;
        final expectedLength = 1;

        // when
        final result = await repository.getPhotos(albumId);

        // then
        expect(result.length, expectedLength);
      },
    );

    test(
      'When albumId is 1, the getPhotos result contains all values.',
      () async {
        // given
        final expectedAlbumId = 1;
        final expectedId = 1;
        final expectedTitle =
            "accusamus beatae ad facilis cum similique qui sunt";
        final expectedUrl = "https://via.placeholder.com/600/92c952";
        final expectedThumbnailUrl = "https://via.placeholder.com/150/92c952";

        // when
        final result = await repository.getPhotos(expectedAlbumId);
        final photo = result.first;

        // then
        expect(photo.albumId, expectedAlbumId);
        expect(photo.id, expectedId);
        expect(photo.title, expectedTitle);
        expect(photo.url, expectedUrl);
        expect(photo.thumbnailUrl, expectedThumbnailUrl);
      },
    );

    test(
      'If an exception is thrown by dataSource, the result of getPhotos is an empty list.',
      () async {
        // given
        final albumId = 1;
        final expectedResult = [];
        final PhotoDataSource dataSource = MockPhotoDataSourceImpl(
          isException: true,
        );
        final PhotoRepository repository = PhotoRepositoryImpl(
          dataSource: dataSource,
        );

        // when
        final result = await repository.getPhotos(albumId);

        // then
        expect(result, expectedResult);
      },
    );

    test(
      'All data has the same albumId.',
      () async {
        // given
        final expectedAlbumId = 1;

        // when
        final result = await repository.getPhotos(expectedAlbumId);

        // then
        for (var photo in result) {
          expect(photo.albumId, expectedAlbumId);
        }
      },
    );
  });
}
