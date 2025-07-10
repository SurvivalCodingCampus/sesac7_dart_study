import 'package:modu_3_dart_study/250709/homework2/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/250709/homework2/dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final json = [
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
      "id": 2,
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
  ];
  final json2 = [];

  @override
  Future<List<PhotoDto>> getPhotos() async {
    return json.map((e) => PhotoDto.fromJson(e)).toList();
  }
}

void main() {
  PhotoDataSourceImpl dataSource = PhotoDataSourceImpl();
  dataSource.getPhotos().then((value) => print(value));
}
