import '../model/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPostsByKeyword(String keyword);
}
