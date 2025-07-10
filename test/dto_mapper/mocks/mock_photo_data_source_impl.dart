import 'package:modu_3_dart_study/dto_mapper/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/dto_mapper/dto/photo_dto.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final List<Map<String, dynamic>> json = [
    {
      "id": "1",
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01",
    },
    {
      "id": "2",
      "type": null,
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02",
    },
    {
      "id": 3,
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03",
    },
    {
      "id": 4,
      "type": "video",
      "title": "This is an video",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01",
    },
    {
      "id": 5,
      "type": "image",
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02",
    },
    {
      "id": "6",
      "type": "",
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03",
    },
  ];

  @override
  Future<List<PhotoDto>> getPhotos() async {
    return json.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
