import 'package:modu_3_dart_study/core/response.dart';

abstract interface class PostDataSource {
  Future<Response<String>> getPosts();
  Future<Response<String>> getPost(int id);
  Future<Response<String>> createPost(String post);
  Future<Response<String>> updatePost(int id, String post);
  Future<Response<String>> patchPost(int id, String post);
  Future<Response<String>> deletePost(int id);
}
