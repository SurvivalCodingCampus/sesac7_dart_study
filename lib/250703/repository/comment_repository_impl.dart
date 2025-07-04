import 'package:modu_3_dart_study/250703/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/250703/model/comment.dart';
import 'package:modu_3_dart_study/250703/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  CommentRepositoryImpl(this._dataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final list = await _dataSource.getComments();
    return list
        .map((e) => Comment.fromJson(e))
        .toList()
        .where((e) => e.postId == postId)
        .toList();
  }
}
