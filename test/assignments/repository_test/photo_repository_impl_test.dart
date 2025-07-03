import 'package:modu_3_dart_study/assignments/repository_practice/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_photo_data_source_impl.dart';

void main() {
  group('PhotoRepositoryImpl Test', () {
    final PhotoDataSource dataSource = MockPhotoDataSourceImpl();
    final PhotoRepository repository = PhotoRepositoryImpl(dataSource);

    test('getPhotos 테스트', () async {
      final photoData1 = await repository.getPhotos(1);
      final photoData2 = await repository.getPhotos(2);
      final invalidPhotoData = await repository.getPhotos(4);

      expect(photoData1.length, 1);
      expect(photoData2.length, 1);
      expect(invalidPhotoData.length, 0);

      expect(photoData1.first.albumId, 1);
      expect(photoData1.first.id, 1);
      expect(
        photoData1.first.title,
        "accusamus beatae ad facilis cum similique qui sunt",
      );
      expect(photoData1.first.url, 'https://via.placeholder.com/600/92c952');
      expect(
        photoData1.first.thumbnailUrl,
        "https://via.placeholder.com/150/92c952",
      );
    });
  });
}
