import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/250703/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/250703/repository/comment_repository_impl.dart';
import 'package:test/test.dart';
import 'comment_repository_impl_test.mocks.dart';

@GenerateMocks([CommentDataSource])
void main() {
  group('CommentRepositoryImpl 테스트', () {
    final json = [
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
        "postId": 2,
        "id": 3,
        "name": "odio adipisci rerum aut animi",
        "email": "Nikita@garfield.biz",
        "body":
            "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione",
      },
    ];

    test('getComments(1)', () async {
      final CommentDataSource dataSource = MockCommentDataSource();
      final commentRepo = CommentRepositoryImpl(dataSource);

      when(dataSource.getComments()).thenAnswer((_) async => json);

      expect((await commentRepo.getComments(1)).length, 2);
    });

    test('getComments(2)', () async {
      final CommentDataSource dataSource = MockCommentDataSource();
      final commentRepo = CommentRepositoryImpl(dataSource);

      when(dataSource.getComments()).thenAnswer((_) async => json);

      expect((await commentRepo.getComments(2)).length, 1);
    });

    test('getComments(3)', () async {
      final CommentDataSource dataSource = MockCommentDataSource();
      final commentRepo = CommentRepositoryImpl(dataSource);

      when(dataSource.getComments()).thenAnswer((_) async => json);

      expect((await commentRepo.getComments(3)).length, 0);
    });
  });
}
