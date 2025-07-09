import 'package:modu_3_dart_study/assignments/http_practice/core/response.dart';

abstract interface class RemoteDataSource {
  // REST API CREATE
  Future<Response<Map<String, dynamic>>> createPost({
    required Map<String, dynamic> post,
  });

  // REST API READ
  Future<Response<List<Map<String, dynamic>>>> getPosts();

  Future<Response<Map<String, dynamic>>> getPost({required int postId});

  // REST API UPDATE
  Future<Response<Map<String, dynamic>>> updatePost({
    required int postId,
    required Map<String, dynamic> post,
  });

  Future<Response<Map<String, dynamic>>> patchPost({
    required int postId,
    required Map<String, dynamic> post,
  });

  // REST API DELETE
  Future<Response<void>> deletePost({required int postId});
}
