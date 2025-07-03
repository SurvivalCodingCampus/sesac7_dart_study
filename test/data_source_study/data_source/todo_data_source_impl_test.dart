import 'package:modu_3_dart_study/data_source_study/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/data_source_study/model/todo.dart';
import 'package:test/test.dart';

void main() {
  group('Todo Test', () {
    test('읽어올 파일 경로를 잘못 입력할 시 예외 처리가 올바르게 작동하는가?', () {
      // given
      final String wrongTodoPath = 'wrongPath/todo.json';
      final TodoDataSourceImpl testTodoSource = TodoDataSourceImpl();

      // when
      testTodoSource.todoFilePath = wrongTodoPath;

      // then
      expect(testTodoSource.getTodo(), throwsException);
    });

    test('정상적으로 파일을 읽어와 역직렬화 했을 때, 올바른 내용의 객체가 생성되는가?', () async {
      // given
      final int givenUserId = 1;
      final int givenId = 1;
      final String givenTitle = 'delectus aut autem';
      final bool givenCompleted = false;
      final TodoDataSourceImpl testTodoSource = TodoDataSourceImpl();

      // when
      final Todo testTodo = await testTodoSource.getTodo();

      // then
      expect(testTodo.userId, equals(givenUserId));
      expect(testTodo.id, equals(givenId));
      expect(testTodo.title, equals(givenTitle));
      expect(testTodo.completed, equals(givenCompleted));
    });
  });

  group('Todos Test', () {
    test('읽어올 파일 경로를 잘못 입력할 시 예외 처리가 올바르게 작동하는가?', () {
      // given
      final String wrongTodosPath = 'wrongPath/todos.json';
      final TodoDataSourceImpl testTodoSource = TodoDataSourceImpl();

      // when
      testTodoSource.todosFilePath = wrongTodosPath;

      // then
      expect(testTodoSource.getTodos(), throwsException);
    });
  });
}
