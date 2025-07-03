import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/comment_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/comment_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_comment_dara_source_impl.dart';

void main() {
  test('comment_repository_impl_test', () async {
    final CommentDataSource mockDataSource = MockCommentDaraSourceImpl();
    final CommentRepository commentRepository = CommentRepositoryImpl(
      mockDataSource,
    );

    final commentsList = await commentRepository.getComments(1);

    expect(commentsList.length, 1);
    expect(commentsList.first.name, "id labore ex et quam laborum");

    expect((await commentRepository.getComments(2)).length, 1);
    expect((await commentRepository.getComments(3)).length, 1);
    expect((await commentRepository.getComments(4)).length, 0);
  });
}

// {
// "postId": 1,
// "id": 1,
// "name": "id labore ex et quam laborum",
// "email": "Eliseo@gardner.biz",
// "body":
// "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium",
// },
// {
// "postId": 2,
// "id": 2,
// "name": "quo vero reiciendis velit similique earum",
// "email": "Jayne_Kuhic@sydney.com",
// "body":
// "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et",
// },
