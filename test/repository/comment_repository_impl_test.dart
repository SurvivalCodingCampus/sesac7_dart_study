import 'package:modu_3_dart_study/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/repository/comment_repository.dart';
import 'package:modu_3_dart_study/repository/comment_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_comment_data_source_impl.dart';

void main() {
  final CommentDataSource dataSource = MockCommentDataSourceImpl();
  final CommentRepository repository = CommentRepositoryImpl(
    dataSource: dataSource,
  );

  group(
    'getComments',
    () {
      test(
        'When postId is 1, the length of the getComments result is 1.',
        () async {
          // given
          final postId = 1;
          final expectedLength = 1;

          // when
          final result = await repository.getComments(postId);

          // then
          expect(result.length, expectedLength);
        },
      );

      test(
        'The result of getComments has all values.',
        () async {
          // given
          final expectedPostId = 1;
          final expectedId = 1;
          final expectedName = "id labore ex et quam laborum";
          final expectedEmail = "Eliseo@gardner.biz";
          final expectedBody =
              "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo necessitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium";

          // when
          final result = await repository.getComments(expectedPostId);
          final comment = result.first;

          // then
          expect(comment.postId, expectedPostId);
          expect(comment.id, expectedId);
          expect(comment.name, expectedName);
          expect(comment.email, expectedEmail);
          expect(comment.body, expectedBody);
        },
      );

      test(
        'If an exception is thrown by dataSource, the result of getComments is an empty list.',
        () async {
          // given
          final expectedResult = [];
          final CommentDataSource dataSource = MockCommentDataSourceImpl(
            isException: true,
          );
          final CommentRepository repository = CommentRepositoryImpl(
            dataSource: dataSource,
          );

          // when
          final result = await repository.getComments(1);

          // then
          expect(result, expectedResult);
        },
      );

      test(
        'All data has the same postId.',
        () async {
          // given
          final expectedPostId = 1;

          // when
          final result = await repository.getComments(expectedPostId);

          // then
          for (var comment in result) {
            expect(comment.postId, expectedPostId);
          }
        },
      );
    },
  );
}
