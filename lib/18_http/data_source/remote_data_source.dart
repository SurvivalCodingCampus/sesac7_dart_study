import 'package:modu_3_dart_study/18_http/core/response.dart';
import 'package:modu_3_dart_study/18_http/dto/post_dto.dart';

abstract interface class RemoteDataSource {
  Future<Response<List<PostDto>>> getPosts();

  Future<Response<PostDto>> getPost(int id);

  Future<Response<PostDto>> createPost(Map<String, dynamic> post);

  Future<Response<PostDto>> updatePost(
    int id,
    Map<String, dynamic> post,
  );

  Future<Response<PostDto>> patchPost(
    int id,
    Map<String, dynamic> post,
  );

  Future<Response<void>> deletePost(int id);
}
