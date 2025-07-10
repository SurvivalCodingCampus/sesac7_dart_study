import 'package:modu_3_dart_study/assignments/dto_mapper_practice/data_source/photo/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/dto/photo/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/http_practice/core/response.dart';

class MockPhotosDataResourceImpl implements PhotoDataSource {
  @override
  Future<Response<List<PhotoDto>>> getPhotos() async {
    final List<Map<String, dynamic>> photoData = [
      {
        "id": 1,
        "type": "article",
        "title": "This is an article",
        "content": "This is the content of the article.",
        "created_at": "2020-01-01",
      },
      {
        "id": "2",
        "type": "image",
        "url": "https://example.com/image.jpg",
        "caption": "This is an image.",
        "created_at": "2020-02-02",
      },
      {
        "id": 3,
        "type": null,
        "url": "https://example.com/video.mp4",
        "caption": "This is a video.",
        "created_at": "2020-03-03",
      },
      {
        "id": 4,
        "url": "https://example.com/unknown.zip",
        "caption": "This is an unknown type.",
        "created_at": "2020-04-04",
      },
    ];

    final photoDTO = photoData.map((e) => PhotoDto.fromJson(e)).toList();

    return Response(statusCode: 200, body: photoDTO, header: {});
  }
}
