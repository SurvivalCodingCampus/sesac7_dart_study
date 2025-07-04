
import 'package:modu_3_dart_study/repository/photo_repository_impl.dart';
import 'package:modu_3_dart_study/repository/photo_repository.dart';
import 'package:modu_3_dart_study/data_source/local/data_source.dart';
import '../mocks/mock_data_source_impl.dart';
import 'package:test/test.dart';

void main () {

  final List<Map<String, dynamic>> json = [
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    },
    {
      "albumId": 1,
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "https://via.placeholder.com/600/771796",
      "thumbnailUrl": "https://via.placeholder.com/150/771796"
    },
    {
      "albumId": 1,
      "id": 3,
      "title": "officia porro iure quia iusto qui ipsa ut modi",
      "url": "https://via.placeholder.com/600/24f355",
      "thumbnailUrl": "https://via.placeholder.com/150/24f355"
    },
  ];

  final DataSource photoDataSource = MockDataSourceImpl(json);
  final PhotoRepository repository = PhotoRepositoryImpl(photoDataSource);

  test('albumId 1인 객체 모두를 불러올 수 있다', () async {
    final photos = await repository.getPhotos(1);

    expect(photos.length, 48);
    expect(photos.first.title, "accusamus beatae ad facilis cum similique qui sunt");

  });
}