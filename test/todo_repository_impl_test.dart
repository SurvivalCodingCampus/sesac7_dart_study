import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/todo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_todo_data_source_impl.dart';

void main() {
  test('todo_repository_impl_test', () async {
    final TodoDataSource todoDataSource = MockTodoDataSourceImpl();
    final TodoRepository todoRepository = TodoRepositoryImpl(todoDataSource);

    final completedTodosList = await todoRepository.getCompletedTodos();

    expect(completedTodosList.length, 2);
    expect(
      completedTodosList.first.title,
      'quis ut nam facilis et officia qui',
    );
  });
}

// {
// "userId": 1,
// "id": 1,
// "title": "delectus aut autem",
// "completed": false
// },
// {
// "userId": 1,
// "id": 2,
// "title": "quis ut nam facilis et officia qui",
// "completed": true
// },
// {
// "userId": 1,
// "id": 3,
// "title": "fugiat veniam minus",
// "completed": true
// }
