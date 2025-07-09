import 'package:modu_3_dart_study/250704/model/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPostByKeyword(String keyword);
}
