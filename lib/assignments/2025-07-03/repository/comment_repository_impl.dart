import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/comment.dart';

import 'comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

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
