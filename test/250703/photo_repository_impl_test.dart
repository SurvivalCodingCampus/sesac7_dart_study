import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/250703/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/250703/repository/photo_repository_impl.dart';
import 'package:test/test.dart';
import 'photo_repository_impl_test.mocks.dart';

@GenerateMocks([PhotoDataSource])
void main() {
  group('PhotoRepositoryImpl 테스트', () {
    List<Map<String, dynamic>> json = [
      {
        "albumId": 1,
        "id": 1,
        "title": "accusamus beatae ad facilis cum similique qui sunt",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952",
      },
      {
        "albumId": 1,
        "id": 2,
        "title": "reprehenderit est deserunt velit ipsam",
        "url": "https://via.placeholder.com/600/771796",
        "thumbnailUrl": "https://via.placeholder.com/150/771796",
      },
      {
        "albumId": 1,
        "id": 3,
        "title": "officia porro iure quia iusto qui ipsa ut modi",
        "url": "https://via.placeholder.com/600/24f355",
        "thumbnailUrl": "https://via.placeholder.com/150/24f355",
      },
    ];

    test('getPhoto(1)', () async {
      final PhotoDataSource dataSource = MockPhotoDataSource();
      final photoRepo = PhotoRepositoryImpl(dataSource);

      when(dataSource.getPhotos()).thenAnswer((_) async => json);

      expect((await photoRepo.getPhotos(1)).length, 3);
    });

    test('getPhotos(2)', () async {
      final PhotoDataSource dataSource = MockPhotoDataSource();
      final photoRepo = PhotoRepositoryImpl(dataSource);

      when(dataSource.getPhotos()).thenAnswer((_) async => json);

      expect((await photoRepo.getPhotos(2)).length, 0);
    });

    test('getPhotos(3)', () async {
      final PhotoDataSource dataSource = MockPhotoDataSource();
      final photoRepo = PhotoRepositoryImpl(dataSource);

      when(dataSource.getPhotos()).thenAnswer((_) async => json);

      expect((await photoRepo.getPhotos(3)).length, 0);
    });
  });
}
