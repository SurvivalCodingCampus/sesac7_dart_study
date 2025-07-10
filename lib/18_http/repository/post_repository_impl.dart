import 'package:modu_3_dart_study/18_http/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/dto/post_dto.dart';
import 'package:modu_3_dart_study/18_http/mapper/post_mapper.dart';
import 'package:modu_3_dart_study/18_http/model/post.dart';
import 'package:modu_3_dart_study/18_http/repository/post_repository.dart';

import '../core/response.dart';
import '../core/result.dart';

void main() async {
  final PostRepository repository = PostRepositoryImpl(
    JsonPlaceHolderDataSourceImpl(),
  );
  final Result<List<Post>> result = await repository.getPostsByKeyword('apple');

  switch (result) {
    case Success<List<Post>>():
      print(result.data);
    case Error<List<Post>>():
      print(result.e);
  }
}

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Post>>> getPostsByKeyword(String keyword) async {
    try {
      final Response<List<PostDto>> response = await _dataSource.getPosts();
      if (response.statusCode != 200) {
        return Result.error('실패');
      }

      final List<Post> posts = response.body
          .map((PostDto dto) => dto.toModel())
          .where((e) => e.title.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
      return Result.success(posts);
    } catch (e) {
      return Result.error('exception');
    }
  }

  @override
  Future<Result<Post>> getPost(int id) async {
    // 성공
    // return Result.success(post)

    // null
    // Result.error('값이 없음')

    // 예외 null
    return Result.error('값이 없음');
  }
}
