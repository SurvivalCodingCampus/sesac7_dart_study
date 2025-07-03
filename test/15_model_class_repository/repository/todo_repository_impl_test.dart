import 'package:modu_3_dart_study/15_model_class_repository/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/todo_repository.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/todo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_todo_data_source_impl.dart';

void main() {
  group('TodoRepositoryImpl Test', () {
    final TodoDataSource dataSource = MockTodoDataSourceImpl();
    final TodoRepository repository = TodoRepositoryImpl(dataSource);

    test('getTodos() Test', () async {
      final todos = await repository.getTodos();

      expect(todos.length, 6);
    });

    test('getCompletedTodos() Test', () async {
      final completedTodos = await repository.getCompletedTodos();

      expect(completedTodos.length, 1);
      expect(completedTodos[0].completed, isTrue);
      expect(completedTodos[0].userId, 1);
      expect(completedTodos[0].id, 4);
      expect(completedTodos[0].title, 'et porro tempora');
    });
  });
}
