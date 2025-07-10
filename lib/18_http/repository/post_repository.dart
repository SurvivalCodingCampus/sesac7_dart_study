import '../core/result.dart';
import '../model/post.dart';

abstract interface class PostRepository {
  Future<Result<List<Post>>> getPostsByKeyword(String keyword);

  Future<Result<Post>> getPost(int id);
}
