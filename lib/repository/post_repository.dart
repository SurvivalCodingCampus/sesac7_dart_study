import 'package:modu_3_dart_study/model/post.dart';

abstract interface class PostRepository {
  Future<List<Post>>getPostsByKeyword(String keyword);
}

// 데이터 가공 로직을 추가 repository

