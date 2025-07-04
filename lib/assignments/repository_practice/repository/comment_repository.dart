import 'package:modu_3_dart_study/assignments/repository_practice/model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}
