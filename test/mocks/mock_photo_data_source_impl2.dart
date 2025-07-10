import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/16_http/core/response.dart';
import 'package:modu_3_dart_study/17_dto_mapper/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/17_dto_mapper/dto/photo_dto.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final http.Client _client = MockClient((request) async {
    return http.Response(
      jsonEncode([
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
          "id": "3",
          "type": "article",
          "title": "This is an article",
          "content": "This is the content of the article.",
          "created_at": "2020-01-01",
        },
        {
          "id": 4,
          "type": null,
          "url": "https://example.com/image.jpg",
          "caption": 10,
          "created_at": "2020-02-02",
        },
        {
          "id": 5,

          "url": "https://example.com/video.mp4",
          "caption": "This is a video.",
          "created_at": "2020-03-03",
        },
      ]),
      200,
    );
  });

  @override
  Future<Response<List<PhotoDto?>>> getPhotoDtos() async {
    final response = await _client.get(
      Uri.parse(''),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return await Future.delayed(
      Duration(seconds: 6),
      () => Response(
        statusCode: response.statusCode,
        header: response.headers,
        body: (jsonDecode(response.body) as List)
            .map((e) => PhotoDto.fromJson(e))
            .toList(),
      ),
    );
  }
}
