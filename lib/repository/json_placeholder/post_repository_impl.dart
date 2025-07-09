import 'dart:convert';

import 'package:modu_3_dart_study/data_source/json_placeholder/post_data_source.dart';
import 'package:modu_3_dart_study/model/post.dart';
import 'package:modu_3_dart_study/repository/json_placeholder/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _dataSource;

  PostRepositoryImpl({required PostDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final response = await _dataSource.getPosts();

    if (!_validateStatusCode(response.statusCode)) {
      return [];
    }

    final List jsonPosts = jsonDecode(response.body);
    return jsonPosts
        .map((e) => Post.fromJson(e))
        .where((e) => e.title.contains(keyword))
        .toList();
  }

  bool _validateStatusCode(int code) {
    if (code >= 200 && code < 300) {
      return true;
    }
    return false;
  }
}
