/*
# Repository 책임 역활
 - 데이터 접근의 진입점
 - 데이터 접근에 대한 추상화 계층
 - 데이터 소스 은닉
 - 비즈니스 로직솨 데이터 소스 사이 중재자
 - 데이터 매핑, 변환 담당

 데이터 소스를 숨기고 상위 계층에서 일관된 방법으로 데이터에 접근 하는 방식을 제공
  즉, 데이터를 비즈니스 로직에 전달
*/
import 'package:modu_3_dart_study/repository/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/repository/model/comment.dart';
import 'package:modu_3_dart_study/repository/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

  // Datasource로 받았다고 생각하고
  @override
  Future<List<Comment>> getComments(int postId) async {
    try {
      final results = await _commentDataSource.getAll();
      return results
          .map((e) => Comment.fromJson(e))
          .where((comment) => comment.postId == postId)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
