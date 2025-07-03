import 'package:modu_3_dart_study/repository/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/repository/repository/comment_repository.dart';
import 'package:modu_3_dart_study/repository/repository/comment_repository_impl.dart';
import 'package:test/test.dart';

import 'Mock/mock_comment_repository_impl.dart';

void main() {
  test('test', () async {
    //given(준비)
    final String name1 = 'id labore ex et quam laborum';
    final CommentDataSource mockDataSource = MockCommentRepositoryImpl();
    final CommentRepository repository = CommentRepositoryImpl(mockDataSource);

    //when(실행)
    final comment = await repository.getComments(1);

    //then(검증)
    expect(comment[0].name, name1);
  });
}
