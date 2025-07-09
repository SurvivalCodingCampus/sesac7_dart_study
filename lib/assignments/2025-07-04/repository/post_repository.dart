import 'package:modu_3_dart_study/assignments/2025-07-04/model/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPostsByKeyword(String keyword);
}
