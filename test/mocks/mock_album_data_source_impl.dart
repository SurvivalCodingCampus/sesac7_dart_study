import 'package:modu_3_dart_study/data_source/album_data_source.dart';

class MockAlbumDataSourceImpl implements AlbumDataSource {
  final jsons = [
    {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
    {"userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa"},
  ];
  final bool? isException;

  MockAlbumDataSourceImpl({this.isException});

  @override
  Future<List<Map<String, dynamic>>> getAlbums() async {
    if (isException != null && isException!) {
      throw Exception('Fail to get albums');
    }

    return jsons;
  }
}
