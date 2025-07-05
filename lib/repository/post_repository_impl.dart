import 'package:modu_3_dart_study/data_source/remote/remote_data_source.dart';
import 'package:modu_3_dart_study/model/post.dart';
import 'package:modu_3_dart_study/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository{

  final RemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final response = await _dataSource.getPosts();
    if ( response.statusCode != 200) {
      throw Exception('실패');
    }

    // response 에 담기는 값은
    // final int statusCode, final Map<String, dynamic> header, final T body

    return response.body
      .map((e) => Post.fromJson(e))
      .where((e) => e.title.toLowerCase().contains(keyword.toLowerCase()))
      .toList();
  }
  
}