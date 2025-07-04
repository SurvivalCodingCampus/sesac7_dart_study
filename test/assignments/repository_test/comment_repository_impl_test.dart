import 'package:modu_3_dart_study/assignments/repository_practice/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/comment_repository.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/comment_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_comment_data_source_impl.dart';

void main() {
  test('comment_repository_impl_test', () async {
    final CommentDataSource mockDataSource = MockCommentDataSourceImpl();
    final CommentRepository repository = CommentRepositoryImpl(mockDataSource);

    final comments = await repository.getComments(1);
    expect(comments.length, 1);
    expect(comments.first.name, 'id labore ex et quam laborum');

    expect((await repository.getComments(2)).length, 1);
    expect((await repository.getComments(3)).length, 1);
    expect((await repository.getComments(4)).length, 0);
  });
}
