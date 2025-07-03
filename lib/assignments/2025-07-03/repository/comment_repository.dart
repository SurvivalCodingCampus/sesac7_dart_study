import 'package:modu_3_dart_study/assignments/2025-07-03/model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}
