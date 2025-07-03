import 'package:modu_3_dart_study/model_class_repository/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/model/comment.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  // DataSource는 굳이 노출할 필요 없으므로 final과 private 처리 같이 함.
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl({required CommentDataSource commentDataSource})
    : _commentDataSource = commentDataSource;

  @override
  Future<List<Comment>> getComments(int postId) async {
    final commentData = await _commentDataSource.getAll();

    return commentData
        .where((e) => e['postId'] == postId) // 입력받은 postId와 같은 comment만 남기고,
        .map((comments) => Comment.fromJson(comments)) // 각각을 Comment로 역직렬화 한 뒤,
        .toList(); // 리스트로 바꾸어 반환
  }
}
