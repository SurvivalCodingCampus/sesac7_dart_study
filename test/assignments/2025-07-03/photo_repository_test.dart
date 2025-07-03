import 'package:modu_3_dart_study/assignments/2025-07-03/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_photo_data_source_impl.dart';

void main() {
  test('Testing PhotoRepositoryImpl with MockPhotoDataSource', () async {
    //given
    final PhotoRepository testRepo = PhotoRepositoryImpl(
      MockPhotoDataSourceImpl(),
    );

    final List<Photo> results = await testRepo.getPhotos(1);

    //when

    //then
    expect(results.length, 3);
    print(results);
  });
}
