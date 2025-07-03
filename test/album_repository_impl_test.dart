import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/album_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/album_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_album_data_source_impl.dart';

void main() {
  test('album_repository_impl_test', () async {
    final AlbumDataSource albumDataSource = MockAlbumDataSourceImpl();
    final AlbumRepository albumRepository = AlbumRepositoryImpl(
      albumDataSource,
    );

    final albumsList = await albumRepository.getAlbums(limit: 3);

    expect(albumsList.length, 3);
    expect(albumsList.first.title, "quidem molestiae enim");

    expect((await albumRepository.getAlbums(limit: 1)).length, 1);
    expect((await albumRepository.getAlbums(limit: 2)).length, 2);
    expect((await albumRepository.getAlbums()).length, 5);
    expect((await albumRepository.getAlbums(limit: 10)).length, 5);
  });
}

// {
// "userId": 1,
// "id": 1,
// "title": "quidem molestiae enim"
// },
// {
// "userId": 1,
// "id": 2,
// "title": "sunt qui excepturi placeat culpa"
// },
// {
// "userId": 1,
// "id": 3,
// "title": "omnis laborum odio"
// },
// {
// "userId": 1,
// "id": 4,
// "title": "non esse culpa molestiae omnis sed optio"
// },
// {
// "userId": 1,
// "id": 5,
// "title": "eaque aut omnis a"
// }
