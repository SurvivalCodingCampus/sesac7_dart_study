import 'package:modu_3_dart_study/250704/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/250704/model/post.dart';
import 'package:modu_3_dart_study/250704/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _remoteDataSource;

  PostRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Post>> getPostByKeyword(String keyword) async {
    final response = await _remoteDataSource.getPosts();

    return response.body
        .map((e) => Post.fromJson(e))
        .where((e) => e.title.contains(keyword))
        .toList();
  }
}
