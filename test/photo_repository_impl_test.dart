import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_photo_data_source_impl.dart';

void main() {
  test('photo_repository_impl_test', () async {
    final PhotoDataSource mockPhotoDataSource = MockPhotoDataSourceImpl();
    final PhotoRepository photoRepository = PhotoRepositoryImpl(
      mockPhotoDataSource,
    );

    final List<Photo> photosList = await photoRepository.getPhotos(1);

    expect(photosList.length, 1);
    expect(
      photosList.first.title,
      'accusamus beatae ad facilis cum similique qui sunt',
    );

    expect((await photoRepository.getPhotos(2)).length, 1);
    expect((await photoRepository.getPhotos(3)).length, 1);
    expect((await photoRepository.getPhotos(4)).length, 0);
  });
}

// {
// "albumId": 1,
// "id": 1,
// "title": "accusamus beatae ad facilis cum similique qui sunt",
// "url": "https://via.placeholder.com/600/92c952",
// "thumbnailUrl": "https://via.placeholder.com/150/92c952"
// },
// {
// "albumId": 2,
// "id": 2,
// "title": "reprehenderit est deserunt velit ipsam",
// "url": "https://via.placeholder.com/600/771796",
// "thumbnailUrl": "https://via.placeholder.com/150/771796"
// }
