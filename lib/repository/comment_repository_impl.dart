import 'package:modu_3_dart_study/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/model/comment.dart';
import 'package:modu_3_dart_study/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  CommentRepositoryImpl({required CommentDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Comment>> getComments(int postId) async {
    try {
      final jsons = await _dataSource.getComments();
      return jsons
          .map(Comment.fromJson)
          .where((e) => e.postId == postId)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
