import 'package:modu_3_dart_study/18_http/core/response_core.dart';

import '../model/post.dart';

abstract interface class RemoteDataSource {
  Future<ResponseCore<List<Post>>> getPosts();

  Future<ResponseCore<Post>> getPost(int id);

  Future<ResponseCore<Post>> createPost(Post post);

  Future<ResponseCore<Post>> updatePost(int id, Post post);

  Future<ResponseCore<Post>> patchPost(int id, Map<String, dynamic> postData);

  Future<ResponseCore<void>> deletePost(int id);
}
