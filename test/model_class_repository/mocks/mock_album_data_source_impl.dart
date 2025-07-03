import 'package:modu_3_dart_study/model_class_repository/data_source/album_data_source.dart';

class MockAlbumDataSourceImpl implements AlbumDataSource {
  final List<Map<String, dynamic>> json = [
    {"userId": 1, "id": 10, "title": "distinctio laborum qui"},
    {
      "userId": 2,
      "id": 11,
      "title": "quam nostrum impedit mollitia quod et dolor",
    },
    {
      "userId": 2,
      "id": 12,
      "title": "consequatur autem doloribus natus consectetur",
    },
    {
      "userId": 2,
      "id": 13,
      "title": "ab rerum non rerum consequatur ut ea unde",
    },
    {"userId": 2, "id": 14, "title": "ducimus molestias eos animi atque nihil"},
    {
      "userId": 2,
      "id": 15,
      "title": "ut pariatur rerum ipsum natus repellendus praesentium",
    },
    {
      "userId": 2,
      "id": 16,
      "title": "voluptatem aut maxime inventore autem magnam atque repellat",
    },
    {"userId": 2, "id": 17, "title": "aut minima voluptatem ut velit"},
    {"userId": 2, "id": 18, "title": "nesciunt quia et doloremque"},
    {
      "userId": 2,
      "id": 19,
      "title": "velit pariatur quaerat similique libero omnis quia",
    },
    {"userId": 2, "id": 20, "title": "voluptas rerum iure ut enim"},
    {
      "userId": 3,
      "id": 21,
      "title":
          "repudiandae voluptatem optio est consequatur rem in temporibus et",
    },
    {"userId": 3, "id": 22, "title": "et rem non provident vel ut"},
    {"userId": 3, "id": 23, "title": "incidunt quisquam hic adipisci sequi"},
    {"userId": 3, "id": 24, "title": "dolores ut et facere placeat"},
    {
      "userId": 3,
      "id": 25,
      "title": "vero maxime id possimus sunt neque et consequatur",
    },
    {"userId": 3, "id": 26, "title": "quibusdam saepe ipsa vel harum"},
  ];

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    return json;
  }
}
