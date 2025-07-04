import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/20250703/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/20250703/repository/album_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'album_test.mocks.dart';

@GenerateMocks([AlbumDataSource])
void main() {
  late MockAlbumDataSource mockAlbumDataSource;

  setUp(() {
    mockAlbumDataSource = MockAlbumDataSource();
  });

  test('앨범 데이터 테스트', () async {
    final dummyDatas = [
      {
        "userId": 1,
        "id": 1,
        "title": "quidem molestiae enim"
      },
      {
        "userId": 1,
        "id": 2,
        "title": "sunt qui excepturi placeat culpa"
      },
      {
        "userId": 1,
        "id": 3,
        "title": "omnis laborum odio"
      },
      {
        "userId": 1,
        "id": 4,
        "title": "non esse culpa molestiae omnis sed optio"
      },
      {
        "userId": 1,
        "id": 5,
        "title": "eaque aut omnis a"
      },
      {
        "userId": 1,
        "id": 6,
        "title": "natus impedit quibusdam illo est"
      },
      {
        "userId": 1,
        "id": 7,
        "title": "quibusdam autem aliquid et et quia"
      },
      {
        "userId": 1,
        "id": 8,
        "title": "qui fuga est a eum"
      },
      {
        "userId": 1,
        "id": 9,
        "title": "saepe unde necessitatibus rem"
      },
      {
        "userId": 1,
        "id": 10,
        "title": "distinctio laborum qui"
      },
      {
        "userId": 2,
        "id": 11,
        "title": "quam nostrum impedit mollitia quod et dolor"
      },
      {
        "userId": 2,
        "id": 12,
        "title": "consequatur autem doloribus natus consectetur"
      },
      {
        "userId": 2,
        "id": 13,
        "title": "ab rerum non rerum consequatur ut ea unde"
      },
      {
        "userId": 2,
        "id": 14,
        "title": "ducimus molestias eos animi atque nihil"
      },
      {
        "userId": 2,
        "id": 15,
        "title": "ut pariatur rerum ipsum natus repellendus praesentium"
      },
      {
        "userId": 2,
        "id": 16,
        "title": "voluptatem aut maxime inventore autem magnam atque repellat"
      },
      {
        "userId": 2,
        "id": 17,
        "title": "aut minima voluptatem ut velit"
      },
      {
        "userId": 2,
        "id": 18,
        "title": "nesciunt quia et doloremque"
      },
      {
        "userId": 2,
        "id": 19,
        "title": "velit pariatur quaerat similique libero omnis quia"
      },
      {
        "userId": 2,
        "id": 20,
        "title": "voluptas rerum iure ut enim"
      },
      {
        "userId": 3,
        "id": 21,
        "title": "repudiandae voluptatem optio est consequatur rem in temporibus et"
      },
      {
        "userId": 3,
        "id": 22,
        "title": "et rem non provident vel ut"
      },
      {
        "userId": 3,
        "id": 23,
        "title": "incidunt quisquam hic adipisci sequi"
      },
      {
        "userId": 3,
        "id": 24,
        "title": "dolores ut et facere placeat"
      },
      {
        "userId": 3,
        "id": 25,
        "title": "vero maxime id possimus sunt neque et consequatur"
      },
      {
        "userId": 3,
        "id": 26,
        "title": "quibusdam saepe ipsa vel harum"
      },
      {
        "userId": 3,
        "id": 27,
        "title": "id non nostrum expedita"
      },
      {
        "userId": 3,
        "id": 28,
        "title": "omnis neque exercitationem sed dolor atque maxime aut cum"
      },
      {
        "userId": 3,
        "id": 29,
        "title": "inventore ut quasi magnam itaque est fugit"
      },
      {
        "userId": 3,
        "id": 30,
        "title": "tempora assumenda et similique odit distinctio error"
      },
      {
        "userId": 4,
        "id": 31,
        "title": "adipisci laborum fuga laboriosam"
      },
      {
        "userId": 4,
        "id": 32,
        "title": "reiciendis dolores a ut qui debitis non quo labore"
      },
      {
        "userId": 4,
        "id": 33,
        "title": "iste eos nostrum"
      },
      {
        "userId": 4,
        "id": 34,
        "title": "cumque voluptatibus rerum architecto blanditiis"
      },
      {
        "userId": 4,
        "id": 35,
        "title": "et impedit nisi quae magni necessitatibus sed aut pariatur"
      },
      {
        "userId": 4,
        "id": 36,
        "title": "nihil cupiditate voluptate neque"
      },
      {
        "userId": 4,
        "id": 37,
        "title": "est placeat dicta ut nisi rerum iste"
      },
      {
        "userId": 4,
        "id": 38,
        "title": "unde a sequi id"
      },
      {
        "userId": 4,
        "id": 39,
        "title": "ratione porro illum labore eum aperiam sed"
      },
      {
        "userId": 4,
        "id": 40,
        "title": "voluptas neque et sint aut quo odit"
      },
      {
        "userId": 5,
        "id": 41,
        "title": "ea voluptates maiores eos accusantium officiis tempore mollitia consequatur"
      },
    ];

    when(mockAlbumDataSource.getAllData()).thenAnswer((_) async => dummyDatas);

    final albumRepository = AlbumRepositoryImpl(mockAlbumDataSource);
    final albums1 = await albumRepository.getAlbums();
    final albums2 = await albumRepository.getAlbums(limit: 4);

    expect(albums1.length, 41);
    expect(albums1.first.title, 'quidem molestiae enim');

    expect(albums2.length, 4);
    expect(albums2.first.title, 'quidem molestiae enim');
  });
}