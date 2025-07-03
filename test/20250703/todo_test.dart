
import 'package:modu_3_dart_study/20250703/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/20250703/repository/todo_repository.dart';
import 'package:modu_3_dart_study/20250703/repository/todo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mocks/mock_todo_data_source_impl.dart';

void main() {
  test('todo_repository_impl_test', () async {
    final TodoDataSource mockDataSource = MockTodoDataSourceImpl();
    final TodoRepository repository = TodoRepositoryImpl(mockDataSource);

    final todos1 = await repository.getTodos();
    final todos2 = await repository.getCompletedTodos();

    expect(todos1.length, 6);
    expect(todos1.first.title, 'delectus aut autem');

    expect(todos2.length, 1);
    expect(todos2.first.title, 'et porro tempora');

  });
}