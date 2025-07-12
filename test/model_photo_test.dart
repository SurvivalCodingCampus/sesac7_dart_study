import 'package:modu_3_dart_study/data_source/local/photo_data_source.dart';
import 'package:modu_3_dart_study/model/model_photo.dart';
import 'package:modu_3_dart_study/repository/model_photo_repository_impl.dart';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/repository/model_photo_repository.dart';

import 'mocks/mock_photo_data_source_impl.dart';

void main() {
  test('mock data 테스트', () async {
    final PhotoDataSource mockDataSource = MockPhotoDataSourceImpl();
    final ModelPhotoRepository repository = ModelPhotoRepositoryImpl(
      mockDataSource,
    );
    (mockDataSource);

    final photoList = await repository.getPhotos();

    expect(photoList.length, 6);
    expect(photoList[2].type, PhotoType.video);
  });
}
