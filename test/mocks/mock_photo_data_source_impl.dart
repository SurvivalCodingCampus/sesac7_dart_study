import 'package:modu_3_dart_study/data_source/photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final jsons = [
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952",
    },
    {
      "albumId": 2,
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "https://via.placeholder.com/600/771796",
      "thumbnailUrl": "https://via.placeholder.com/150/771796",
    },
  ];
  final bool? isException;

  MockPhotoDataSourceImpl({this.isException});

  @override
  Future<List<Map<String, dynamic>>> getPhotos() async {
    if (isException != null && isException!) {
      throw Exception('Fail to get photos');
    }

    return jsons;
  }
}
