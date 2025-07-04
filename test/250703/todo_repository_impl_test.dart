import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/250703/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/250703/repository/todo_repository_impl.dart';
import 'package:test/test.dart';
import 'todo_repository_impl_test.mocks.dart';

@GenerateMocks([TodoDataSource])
void main() {
  group('TodoRepositoryImpl 테스트', () {
    final json = [
      {
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false,
      },
      {
        "userId": 1,
        "id": 2,
        "title": "quis ut nam facilis et officia qui",
        "completed": false,
      },
      {
        "userId": 1,
        "id": 3,
        "title": "fugiat veniam minus",
        "completed": false,
      },
      {
        "userId": 1,
        "id": 4,
        "title": "et porro tempora",
        "completed": true,
      },
      {
        "userId": 1,
        "id": 5,
        "title":
            "laboriosam mollitia et enim quasi adipisci quia provident illum",
        "completed": false,
      },
    ];

    test('getTodos()', () async {
      final TodoDataSource dataSource = MockTodoDataSource();
      final todoRepo = TodoRepositoryImpl(dataSource);

      when(dataSource.getTodos()).thenAnswer((_) async => json);
      expect((await todoRepo.getTodos()).length, 5);
    });

    test('getCompletedTodos()', () async {
      final TodoDataSource dataSource = MockTodoDataSource();
      final todoRepo = TodoRepositoryImpl(dataSource);

      when(dataSource.getTodos()).thenAnswer((_) async => json);
      expect((await todoRepo.getCompletedTodos()).length, 1);
    });
  });
}
