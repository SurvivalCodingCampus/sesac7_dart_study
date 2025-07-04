import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/250703/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/250703/repository/album_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'album_reposity_impl_test.mocks.dart';

@GenerateMocks([AlbumDataSource])
void main() {
  final mockAlbumDataSource = MockAlbumDataSource();

  test('', () async {
    final json = [
      {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
      {"userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa"},
      {"userId": 1, "id": 3, "title": "omnis laborum odio"},
      {"userId": 1, "id": 5, "title": "eaque aut omnis a"},
      {"userId": 1, "id": 6, "title": "natus impedit quibusdam illo est"},
      {"userId": 1, "id": 7, "title": "quibusdam autem aliquid et et quia"},
      {"userId": 1, "id": 8, "title": "qui fuga est a eum"},
      {"userId": 1, "id": 9, "title": "saepe unde necessitatibus rem"},
      {"userId": 1, "id": 10, "title": "distinctio laborum qui"},
      {"userId": 2, "id": 17, "title": "aut minima voluptatem ut velit"},
      {"userId": 2, "id": 18, "title": "nesciunt quia et doloremque"},
      {"userId": 3, "id": 22, "title": "et rem non provident vel ut"},
      {"userId": 3, "id": 23, "title": "incidunt quisquam hic adipisci sequi"},
      {"userId": 3, "id": 24, "title": "dolores ut et facere placeat"},
      {"userId": 3, "id": 26, "title": "quibusdam saepe ipsa vel harum"},
      {"userId": 3, "id": 27, "title": "id non nostrum expedita"},
      {"userId": 4, "id": 31, "title": "adipisci laborum fuga laboriosam"},
      {"userId": 4, "id": 36, "title": "nihil cupiditate voluptate neque"},
      {"userId": 4, "id": 37, "title": "est placeat dicta ut nisi rerum iste"},
      {"userId": 4, "id": 38, "title": "unde a sequi id"},
    ];

    when(mockAlbumDataSource.getAlbums()).thenAnswer((_) async => json);

    final albumRepository = AlbumRepositoryImpl(mockAlbumDataSource);
    final albums1 = await albumRepository.getAlbums();
    final albums2 = await albumRepository.getAlbums(limit: 10);

    expect(albums1.length, 20);
    expect(albums1.first.title, 'quidem molestiae enim');

    expect(albums2.length, 10);
    expect(albums2.first.title, 'quidem molestiae enim');
  });
}
