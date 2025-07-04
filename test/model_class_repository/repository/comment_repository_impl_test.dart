import 'package:modu_3_dart_study/model_class_repository/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/comment_repository.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/comment_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_comment_data_source_impl.dart';

void main() {
  test('입력받은 postId와 같은 comment만을 정확히 반환하는가?', () async {
    // given
    final int givenPostId = 1;
    final CommentDataSource commentDataSource = MockCommentDataSourceImpl();
    final CommentRepository commentRepository = CommentRepositoryImpl(
      commentDataSource: commentDataSource,
    );

    // when
    final result = await commentRepository.getComments(givenPostId);

    // then
    for (int i = 0; i < result.length; i++) {
      expect(result[i].postId, equals(givenPostId));
    }
  });
}
