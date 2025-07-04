import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/comment.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/comment_repository.dart';

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
