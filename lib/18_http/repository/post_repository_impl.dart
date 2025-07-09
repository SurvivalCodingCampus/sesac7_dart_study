import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/dto/post_dto.dart';
import 'package:modu_3_dart_study/18_http/mapper/post_mapper.dart';
import 'package:modu_3_dart_study/18_http/model/post.dart';
import 'package:modu_3_dart_study/18_http/repository/post_repository.dart';

import '../core/response.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    final Response<List<PostDto>> response = await _dataSource.getPosts();
    if (response.statusCode != 200) {
      throw Exception('실패');
    }

    return response.body
        .map((PostDto dto) => dto.toModel())
        .where((e) => e.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
