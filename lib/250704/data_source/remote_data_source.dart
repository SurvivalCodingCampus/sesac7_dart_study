import 'package:modu_3_dart_study/250704/core/response.dart';

abstract interface class RemoteDataSource {
  Future<Response<List<dynamic>>> getPosts();

  Future<Response<Map<String, dynamic>>> getPost({required int id});

  Future<Response<Map<String, dynamic>>> createPost({
    required Map<String, dynamic> post,
  });

  Future<Response<Map<String, dynamic>>> updatePost({
    required int id,
    required Map<String, dynamic> post,
  });

  Future<Response<Map<String, dynamic>>> patchPost({
    required int id,
    required Map<String, dynamic> post,
  });

  Future<Response<void>> deletePost({required int id});
}
