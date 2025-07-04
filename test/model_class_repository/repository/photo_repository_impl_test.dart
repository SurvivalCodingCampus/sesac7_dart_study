import 'package:modu_3_dart_study/model_class_repository/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_photo_data_source_impl.dart';

void main() {
  test('입력된 id의 사진을 정확히 반환하는가?', () async {
    // given
    final int testId = 2;
    final PhotoDataSource photoDataSource = MockPhotoDataSourceImpl();
    final PhotoRepositoryImpl photoRepositoryImpl = PhotoRepositoryImpl(
      photoDataSource: photoDataSource,
    );

    // when
    final result = await photoRepositoryImpl.getPhotos(testId);

    // then
    for (int i = 0; i < result.length; i++) {
      expect(result[i].albumId, equals(testId));
    }
  });
}
