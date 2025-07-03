import 'package:modu_3_dart_study/data_source/comment/comment_data_source.dart';
import 'package:modu_3_dart_study/data_source/comment/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/model/comment.dart';
import 'package:modu_3_dart_study/repository/comment/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _dataSource;

  CommentRepositoryImpl({required CommentDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Comment>> getCommentsById({required int postId}) async {
    final List<Map<String, dynamic>> comments = await _dataSource.getAll();
    return comments
        .map((comment) => Comment.fromJson(comment))
        .where((comment) => comment.postId == postId)
        .toList();
  }
}

void main() async {
  CommentDataSource commentDataSource = CommentDataSourceImpl(filePath: 'json_data/comments.json');
  CommentRepository commentRepository = CommentRepositoryImpl(dataSource: commentDataSource);
  print(await commentRepository.getCommentsById(postId: 1));
}