import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/photo_repository.dart';
import 'package:test/test.dart';

import '../mocks/mock_photo_model_data_source_impl.dart';

void main() {
  test('photo_repository_impl_test', () async {
    final PhotoDataSource mockPhotoDataSource = MockPhotoModelDataSourceImpl();
    final PhotoRepository photoRepository = PhotoRepository(
      mockPhotoDataSource,
    );

    final List<Photo> photosList = await photoRepository.getPhotos();
    print(photosList.length);
    print(photosList.first.type);
  });
}
