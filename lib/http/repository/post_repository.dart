import 'package:modu_3_dart_study/http/model/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPostsByKeyword(String keyword);
}
