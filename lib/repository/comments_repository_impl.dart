import 'package:modu_3_dart_study/repository/comments_repository.dart';
import 'package:modu_3_dart_study/data_source/local/comment_data_source.dart';
import 'package:modu_3_dart_study/model/comment.dart';

// 구현체
class CommentsRepositoryImpl implements CommentsRepository {
  final CommentDataSource _dataSource;

  CommentsRepositoryImpl(this._dataSource);
  
  @override
  Future<List<Comment>> getComments(int postId) async {
    try {
      final results = await _dataSource.getAll();
      return results
        .map((e) => Comment.fromJson(e))
        .where((comment) => comment.postId == postId)
        .toList();
    } catch (e) {
      return [];
    }
  }
}