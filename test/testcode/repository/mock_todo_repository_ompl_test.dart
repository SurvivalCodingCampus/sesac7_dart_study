import 'package:modu_3_dart_study/repository/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/repository/repository/todo_repository.dart';
import 'package:modu_3_dart_study/repository/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_todo_repository_impl.dart';

void main() {
  test('Repository 작성 연습 3 test', () async {
    //given(준비)
    final bool completed = false;
    final int completedId = 4;
    final int id = 1;
    final TodoDataSource todoDataSource = MockTodoRepositoryImpl();
    final TodoRepository repository = TodoRepositoryImpl(todoDataSource);

    //when(실행)
    final complededTodos = await repository.getCompletedTodos();
    final todos = await repository.getTodos();

    //then(검증)
    expect(complededTodos.first.id, completedId); // 첫번째 completed
    expect(todos.first.id, id);
  });
}
