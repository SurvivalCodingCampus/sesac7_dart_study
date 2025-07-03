import 'package:modu_3_dart_study/17_repository/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/17_repository/model/comment.dart';
import 'package:modu_3_dart_study/17_repository/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  CommentRepositoryImpl(this._dataSource);

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
