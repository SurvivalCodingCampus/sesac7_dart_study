import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/model/post.dart';
import 'package:modu_3_dart_study/18_http/repository/post_repository.dart';

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
        .map((e) => Post.fromJson(e))
        .where((e) => e.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
