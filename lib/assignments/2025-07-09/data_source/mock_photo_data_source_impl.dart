import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/photo_dto.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final String mockString = """
[
    {
        "id": 1,
        "type": "article",
        "title": "This is an article",
        "content": "This is the content of the article.",
        "created_at": "2020-01-01"
    },
    {
        "id": 2,
        "type": "image",
        "url": "https://example.com/image.jpg",
        "caption": "This is an image.",
        "created_at": "2020-02-02"
    },
    {
        "id": 3,
        "type": "video",
        "url": "https://example.com/video.mp4",
        "caption": "This is a video.",
        "created_at": "2020-03-03"
    },
    {
        "id": "4",
        "type": "article",
        "title": "This is an article",
        "content": "This is the content of the article."
    },
    {
        "id": 5,
        "type": null,
        "url": "https://example.com/image.jpg",
        "caption": "This is an image.",
        "created_at": null
    },
    {
        "id": 6,
        "url": "https://example.com/video.mp4",
        "caption": "This is a video.",
        "created_at": "2020-03-03"
    }
]
""";
  @override
  List<PhotoDTO> getPhotoDTOs() {
    final mapOfData = jsonDecode(mockString);
    final listOfDTO = (mapOfData as List)
        .map((e) => PhotoDTO.fromJson(e))
        .toList();
    return listOfDTO;
  }
}
