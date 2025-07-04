import 'package:modu_3_dart_study/15_model_class_repository/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/photo_repository.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/photo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_photo_data_source_impl.dart';

void main() {
  group('PhotoRepositoryImpl Test', () {
    final PhotoDataSource dataSource = MockPhotoDataSourceImpl();
    final PhotoRepository repository = PhotoRepositoryImpl(dataSource);

    test('getPhotos(int albumId) 테스트', () async {
      final photo1 = await repository.getPhotos(1);
      final photo2 = await repository.getPhotos(2);
      final photo3 = await repository.getPhotos(3);
      final photo4 = await repository.getPhotos(4);

      expect(photo1.length, 1);
      expect(photo2.length, 1);
      expect(photo3.length, 1);
      expect(photo4.length, 0);

      expect(photo1.first.albumId, 1);
      expect(photo1.first.id, 1);
      expect(
        photo1.first.title,
        'accusamus beatae ad facilis cum similique qui sunt',
      );
      expect(
        photo1.first.url,
        'https://via.placeholder.com/600/92c952',
      );
      expect(
        photo1.first.thumbnailUrl,
        'https://via.placeholder.com/150/92c952',
      );
    });
  });
}
