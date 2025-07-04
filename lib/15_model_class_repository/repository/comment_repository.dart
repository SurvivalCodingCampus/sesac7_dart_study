import 'package:modu_3_dart_study/15_model_class_repository/model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}
