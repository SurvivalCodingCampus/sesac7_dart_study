

import '../core/response.dart';

abstract interface class RemoteDataSource {
  Future<Response<String>> getPosts();

  Future<Response<Map<String, dynamic>>> getPost(int id);

  Future<Response<Map<String, dynamic>>> createPost(Map<String, dynamic> post);

  Future<Response<Map<String, dynamic>>> updatePost(
    int id,
    Map<String, dynamic> post,
  );

  Future<Response<String>> patchPost(
    int id,
    Map<String, dynamic> post,
  );

  Future<Response<String>> deletePost(int id);
}
