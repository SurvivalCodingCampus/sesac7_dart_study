import 'package:modu_3_dart_study/data_source/remote/remote_data_source.dart';
import 'package:modu_3_dart_study/dto/post_dto.dart';
import 'package:modu_3_dart_study/mapper/post_mapper.dart';
import 'package:modu_3_dart_study/model/post.dart';
import 'package:modu_3_dart_study/repository/post_repository.dart';

import '../core/response.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    // final response = await _dataSource.getPosts();
    // if (response.statusCode != 200) {
    //   throw Exception('실패');
    // }

    final Response<List<PostDto>> response = await _dataSource.getPosts();
    if (response.statusCode != 200) {
      throw Exception('실패');
    }

    // response 에 담기는 값은
    // final int statusCode, final Map<String, dynamic> header, final T body

    // body: castedBody.map((e) => PostDto.fromJson(e)).toList(),
    // body 는 현재 List<PostDto>
    return response
        .body // List<PostDto>
        // .map((e) => Post.fromJson(e))
        .map((PostDto dto) => dto.toModel())
        // map 은 리스트 내부 하나씩 순회하면서 새로운 리스트를 리턴해주는 함수
        // map 의 결과는 항상 새로운 리스트가 됨
        // PostDto 는 서버랑 주고받는 용도 vs Post 는 앱 내부에서 사용하는 용도
        // List<PostDto> 에서 Post로 변환
        .where((e) => e.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
