import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/album_data_source.dart';

class MockAlbumDataSourceImpl implements AlbumDataSource {
  final List<Map<String, dynamic>> json = [
    {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
    {"userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa"},
    {"userId": 1, "id": 3, "title": "omnis laborum odio"},
    {"userId": 1, "id": 4, "title": "non esse culpa molestiae omnis sed optio"},
    {"userId": 1, "id": 5, "title": "eaque aut omnis a"},
  ];

  @override
  Future<List<Map<String, dynamic>>> getAllAlbums() async {
    return json;
  }
}
