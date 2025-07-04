import 'package:modu_3_dart_study/model_class_repository/model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}

