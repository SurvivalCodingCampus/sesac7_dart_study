import 'package:modu_3_dart_study/repository/comments_repository.dart';
import 'package:modu_3_dart_study/data_source/local/comment_data_source.dart';
import 'package:modu_3_dart_study/repository/comments_repository_impl.dart';
import '../mocks/mock_comment_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  test('comment_repository_impl_test', () async {
  final List<Map<String, dynamic>> json = [
    {
      "postId": 1,
      "id": 1,
      "name": "id labore ex et quam laborum",
      "email": "Eliseo@gardner.biz",
      "body":
          "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium",
    },
    {
      "postId": 1,
      "id": 2,
      "name": "quo vero reiciendis velit similique earum",
      "email": "Jayne_Kuhic@sydney.com",
      "body":
          "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et",
    },
    {
      "postId": 1,
      "id": 3,
      "name": "odio adipisci rerum aut animi",
      "email": "Nikita@garfield.biz",
      "body":
          "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione",
    },
  ];

    final CommentDataSource mockDataSource = MockCommentDataSourceImpl(json);
    final CommentsRepository repository = CommentsRepositoryImpl(mockDataSource);
    // 상위타입에 의존하게 하기 위해서
    // 구현체가 바뀌면 구현체만 바꿔서 작성하고 테스트 코드는 변경하지 않아도 된다

    final comments = await repository.getComments(1);
    expect(comments.length, 1);
    expect(comments.first.name, 'id labore ex et quam laborum');

    expect((await repository.getComments(2)).length, 1);
    expect((await repository.getComments(3)).length, 1);
    expect((await repository.getComments(4)).length, 0);
  });
}