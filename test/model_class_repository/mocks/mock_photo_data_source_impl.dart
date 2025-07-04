import 'package:modu_3_dart_study/model_class_repository/data_source/photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final List<Map<String, dynamic>> json = [
    {
      "albumId": 2,
      "id": 51,
      "title": "non sunt voluptatem placeat consequuntur rem incidunt",
      "url": "https://via.placeholder.com/600/8e973b",
      "thumbnailUrl": "https://via.placeholder.com/150/8e973b",
    },
    {
      "albumId": 2,
      "id": 52,
      "title": "eveniet pariatur quia nobis reiciendis laboriosam ea",
      "url": "https://via.placeholder.com/600/121fa4",
      "thumbnailUrl": "https://via.placeholder.com/150/121fa4",
    },
    {
      "albumId": 2,
      "id": 53,
      "title": "soluta et harum aliquid officiis ab omnis consequatur",
      "url": "https://via.placeholder.com/600/6efc5f",
      "thumbnailUrl": "https://via.placeholder.com/150/6efc5f",
    },
    {
      "albumId": 2,
      "id": 54,
      "title": "ut ex quibusdam dolore mollitia",
      "url": "https://via.placeholder.com/600/aa8f2e",
      "thumbnailUrl": "https://via.placeholder.com/150/aa8f2e",
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    return json;
  }
}
