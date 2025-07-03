import 'package:modu_3_dart_study/assignments/repository_practice/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/todo_repository.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/todo_repsitory_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_todo_data_source_impl_test.dart';

void main() {
  group('TodoRepositoryImpl Test', () {
    final TodoDataSource dataSource = MockTodoDataSourceImpl();
    final TodoRepository repository = TodoRepositoryImpl(dataSource);

    test('getTodos()는 전체 Todo 리스트를 반환해야 한다', () async {
      final todos = await repository.getTodos();
      expect(todos.length, 5);
      expect(todos.first.title, 'delectus aut autem');
    });

    test('getCompletedTodos()는 완료된 Todo 리스트만 반환해야 한다', () async {
      final completedTodos = await repository.getCompletedTodos();

      expect(completedTodos.length, 1);
      expect(completedTodos.first.completed, isTrue);
      expect(completedTodos.first.id, 4);
    });
  });
}
