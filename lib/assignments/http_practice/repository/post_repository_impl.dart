import 'dart:io';

import 'package:modu_3_dart_study/assignments/http_practice/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/http_practice/model/post.dart';
import 'package:modu_3_dart_study/assignments/http_practice/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final response = await _dataSource.getPosts();

    // 200번대, 400번대, 500번대
    if (response.statusCode >= 400) {
      throw HttpException('http request Error');
    }

    return response.body
        .map((res) => Post.fromJson(res))
        .where((post) => post.title.contains(keyword))
        .toList();
  }
}
