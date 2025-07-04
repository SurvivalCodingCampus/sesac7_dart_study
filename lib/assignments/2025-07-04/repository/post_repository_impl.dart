import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/model/post.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _remoteDataSource;

  PostRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final response = await _remoteDataSource.getPosts();
    if (response.statusCode != 200) {
      throw Exception('실패');
    }

    return response.body
        .map((map) => Post.fromJson(map))
        .where(
          (post) => post.title.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }
}
