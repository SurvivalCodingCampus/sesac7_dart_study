import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/photo2/photo2_data_source.dart';
import 'package:modu_3_dart_study/dto/photo2/photo2_dto.dart';

class MockPhoto2DataSourceImpl implements Photo2DataSource {
  final jsons = [
    {
      "id": 1,
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01",
    },
    {
      "id": 2,
      "type": "image",
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02",
    },
    {
      "id": 3,
      "type": "video",
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03",
    },
    {
      "id": "1",
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01",
    },
    {
      "id": 5,
      "type": null,
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02",
    },
    {
      "id": 6,
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03",
    },
  ];
  final int statusCode;
  final bool isException;

  MockPhoto2DataSourceImpl({int? statusCode, bool? isException})
    : statusCode = statusCode ?? 200,
      isException = isException ?? false;

  @override
  Future<Response<List<Photo2Dto>>> getPhotos() async {
    if (isException) {
      throw Exception('network fail');
    }

    return Response(
      statusCode: statusCode,
      headers: {},
      body: jsons.map(Photo2Dto.fromJson).toList(),
    );
  }
}
