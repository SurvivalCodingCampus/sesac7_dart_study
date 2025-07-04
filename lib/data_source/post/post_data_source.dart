import 'package:modu_3_dart_study/core/response.dart';

import '../../model/post.dart';

abstract interface class PostDataSource {
  Future<Response<List<Map<String, dynamic>>>> getPosts();
  Future<Response<Map<String, dynamic>>> getPost(int id);
  Future<Response<Map<String, dynamic>>> createPost(Post post);
  Future<Response<Map<String, dynamic>>> updatePost(int id, Post post);
  Future<Response<Map<String, dynamic>>> patchPost(int id, Post post);
  Future<Response<void>> deletePost(int id);
}