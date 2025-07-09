import 'package:modu_3_dart_study/18_http/repository/post_repository.dart';

import '../data_source/remote_data_source.dart';
import '../model/post.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final response = await _dataSource.getPosts();
    if (response.statusCode != 200) {
      throw Exception('실패');
    }

    return response.body
        .where((post) => post.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}