import 'package:modu_3_dart_study/http/reponse.dart';

// post는 입력(생성, 수정)하고 싶은 값
abstract interface class RemoteDataSource {
  Future<Response<List<Map<String, dynamic>>>> getPosts(); // GET

  Future<Response<Map<String, dynamic>>> getPost(int id); // GET

  Future<Response<Map<String, dynamic>>> createPost(
    Map<String, dynamic> post,
  ); // POST

  Future<Response<Map<String, dynamic>>> updatePost(
    int id,
    Map<String, dynamic> post,
  ); // PUT

  Future<Response<Map<String, dynamic>>> patchPost(
    int id,
    Map<String, dynamic> post,
  ); // PATCH

  Future<Response<void>> deletePost(int id); // DELETE
}
