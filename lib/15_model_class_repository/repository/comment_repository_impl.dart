import 'package:modu_3_dart_study/15_model_class_repository/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/model/comment.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  CommentRepositoryImpl(this._dataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    try {
      final comments = await _dataSource.getAll();
      return comments
          .map((e) => Comment.fromJson(e))
          .where((e) => e.postId == postId)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
