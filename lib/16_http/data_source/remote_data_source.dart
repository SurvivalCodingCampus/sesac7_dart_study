import '../core/response.dart';

abstract interface class RemoteDataSource {
  Future<Response<Map<String, dynamic>>> getPost(int id);

  Future<Response<List<Map<String, dynamic>>>> getPosts();

  Future<Response<Map<String, dynamic>>> createPost(Map<String, dynamic> post);

  Future<Response<Map<String, dynamic>>> updatePost(
    int id,
    Map<String, dynamic> post,
  );

  Future<Response<Map<String, dynamic>>> patchPost(
    int id,
    Map<String, dynamic> post,
  );

  Future<Response<void>> deletePost(int id);
}
