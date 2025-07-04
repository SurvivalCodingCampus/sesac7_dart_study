import 'package:modu_3_dart_study/assignments/repository_practice/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/model/comment.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  CommentRepositoryImpl(this._dataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final results = await _dataSource.getAll();
    return results
        .map((result) => Comment.fromJson(result))
        .where((comment) => comment.postId == postId)
        .toList();
  }
}
