import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/post/post_data_source.dart';
import 'package:modu_3_dart_study/model/post.dart';
import 'package:modu_3_dart_study/repository/post/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _dataSource;

  PostRepositoryImpl(PostDataSource dataSource) : _dataSource = dataSource;

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final Response<List<Map<String, dynamic>>> postsResponse = await _dataSource
        .getPosts();

    if (postsResponse.statusCode != 200) {
      throw ('getPosts 통신 실패');
    }

    final List<Post> posts = postsResponse.body
        .map((post) => Post.fromJson(post))
        .toList();

    return posts
        .where(
          (post) =>
              post.title?.toLowerCase().contains(keyword.toLowerCase()) ??
              false,
        )
        .toList();
  }
}
