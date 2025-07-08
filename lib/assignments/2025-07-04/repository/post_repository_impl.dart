import 'package:modu_3_dart_study/assignments/2025-07-04/core/response.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/model/post.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _remoteDataSource;

  PostRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final Response<List<Map<String, dynamic>>> response =
        await _remoteDataSource.getPosts();
    // final List<Post> posts = response.body
    //     .map((e) => Post.fromJson(e))
    //     .toList();
    if (response.statusCode != 200) {
      throw Exception('실패');
    }
    return (response.body)
        .map((e) => Post.fromJson(e))
        .where(
          (post) => post.title.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }
}

void main() async {
  final List<Post> postsByKeyword = await PostRepositoryImpl(
    JsonPlaceHolderDataSourceImpl(),
  ).getPostsByKeyword('esse');
  print(postsByKeyword.length);
  print(postsByKeyword.first.title);
}

// Future<List<Post>> getPostsByKeyword(String keyword) async {
//   final Response<List<Map<String, dynamic>>> response =
//   await _remoteDataSource.getPosts();
//   final List<Post> posts = response.body
//       .map((e) => Post.fromJson(e))
//       .toList();
//   if (response.statusCode != 200) {
//     throw Exception('실패');
//   }
//   return posts
//       .where(
//         (post) => post.title.toLowerCase().contains(keyword.toLowerCase()),
//   )
//       .toList();
// }
