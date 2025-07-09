import 'dart:convert';

import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/json_placeholder/post_data_source.dart';

class MockPostDataSourceImpl implements PostDataSource {
  final jsons = [
    {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
    },
    {
      "userId": 2,
      "id": 2,
      "title": "qui est esse",
      "body":
          "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla",
    },
    {
      "userId": 3,
      "id": 3,
      "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
      "body":
          "et iusto sed quo iure voluptatem occaecati omnis eligendi aut ad voluptatem doloribus vel accusantium quis pariatur molestiae porro eius odio et labore et velit aut",
    },
  ];
  final bool? isFail;

  MockPostDataSourceImpl({this.isFail});

  @override
  Future<Response<String>> createPost(String post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<Response<String>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Response<String>> getPost(int id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<Response<String>> getPosts() async {
    if (isFail != null && isFail!) {
      return Response(statusCode: 404, headers: {}, body: '');
    }

    return Response(statusCode: 200, headers: {}, body: jsonEncode(jsons));
  }

  @override
  Future<Response<String>> patchPost(int id, String post) {
    // TODO: implement patchPost
    throw UnimplementedError();
  }

  @override
  Future<Response<String>> updatePost(int id, String post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
