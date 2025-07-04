import 'package:modu_3_dart_study/data_source/comment/comment_data_source.dart';
import 'package:modu_3_dart_study/repository/comment/comment_repository.dart';
import 'package:modu_3_dart_study/repository/comment/comment_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_comment_data_source_impl.dart';

void main() {
  test('CommentDataSourceImpl Test', () async {
    final CommentDataSource mockCommentDataSource = MockCommentDataSourceImpl();
    final CommentRepository commentRepository = CommentRepositoryImpl(dataSource: mockCommentDataSource);

    expect((await commentRepository.getCommentsById(postId: 0)).length, equals(0));
    expect((await commentRepository.getCommentsById(postId: 1)).length, equals(2));
    expect((await commentRepository.getCommentsById(postId: 2)).length, equals(1));
    expect((await commentRepository.getCommentsById(postId: 1)).first.name, equals('id labore ex et quam laborum'));
  });
}