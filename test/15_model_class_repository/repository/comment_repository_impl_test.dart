import 'package:modu_3_dart_study/15_model_class_repository/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/comment_repository.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/comment_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_comment_data_source_impl.dart';

void main() {
  group('CommentRepositoryImpl Test', () {
    final CommentDataSource mockDataSource = MockCommentDataSourceImpl();
    final CommentRepository repository = CommentRepositoryImpl(mockDataSource);

    test('getComments() Test', () async {
      final comments = await repository.getComments(1);

      expect(comments.length, 1);
      expect(comments.first.name, 'id labore ex et quam laborum');

      expect((await repository.getComments(2)).length, 1);
      expect((await repository.getComments(3)).length, 1);
      expect((await repository.getComments(4)).length, 0);
    });
  });
}
