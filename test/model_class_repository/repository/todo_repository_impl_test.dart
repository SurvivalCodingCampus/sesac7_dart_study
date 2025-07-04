import 'package:modu_3_dart_study/model_class_repository/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_todo_data_source_impl.dart';

void main() {
  test('모든 Todo를 정확히 반환하는가?', () async {
    // given
    final int givenTodo = 5;
    final TodoDataSource todoDataSource = MockTodoDataSourceImpl();
    final TodoRepositoryImpl todoRepositoryImpl = TodoRepositoryImpl(
      todoDataSource: todoDataSource,
    );

    // when
    final result = await todoRepositoryImpl.getTodos();

    // then
    expect(result.length, equals(givenTodo));
  });

  test('완료된 Todo만 정확히 반환하는가?', () async {
    // given
    final int givenTodo = 3;
    final TodoDataSource todoDataSource = MockTodoDataSourceImpl();
    final TodoRepositoryImpl todoRepositoryImpl = TodoRepositoryImpl(
      todoDataSource: todoDataSource,
    );

    // when
    final result = await todoRepositoryImpl.getCompletedTodos();

    // then
    expect(result.length, equals(givenTodo));
    for (int i = 0; i < result.length; i++) {
      expect(result[i].completed, isTrue);
    }
  });
}
