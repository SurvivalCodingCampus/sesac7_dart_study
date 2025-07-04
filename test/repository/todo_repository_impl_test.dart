import 'package:modu_3_dart_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/repository/todo_repository.dart';
import 'package:modu_3_dart_study/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_todo_data_source_impl.dart';

void main() {
  final TodoDataSource dataSource = MockTodoDataSourceImpl();
  final TodoRepository repository = TodoRepositoryImpl(dataSource: dataSource);

  group(
    'getCompletedTodos',
    () {
      test('getCompletedTodos returns 1 result.', () async {
        // given
        final expectedLength = 1;

        // when
        final result = await repository.getCompletedTodos();

        // then
        expect(result.length, expectedLength);
      });

      test('The result of getCompletedTodos has all values.', () async {
        // given
        final expectedUserId = 1;
        final expectedId = 1;
        final expectedTitle = "delectus aut autem";
        final expectedCompleted = true;

        // when
        final result = await repository.getCompletedTodos();
        final todo = result.first;

        // then
        expect(todo.userId, expectedUserId);
        expect(todo.id, expectedId);
        expect(todo.title, expectedTitle);
        expect(todo.completed, expectedCompleted);
      });

      test(
        'If an exception is thrown by dataSource, the result of getCompletedTodos is an empty list.',
        () async {
          // given
          final expectedResult = [];
          final TodoDataSource dataSource = MockTodoDataSourceImpl(
            isException: true,
          );
          final TodoRepository repository = TodoRepositoryImpl(
            dataSource: dataSource,
          );

          // when
          final result = await repository.getCompletedTodos();

          // then
          expect(result, expectedResult);
        },
      );

      test('completed is true for all data.', () async {
        // given

        // when
        final result = await repository.getCompletedTodos();

        // then
        for (var todo in result) {
          expect(todo.completed, isTrue);
        }
      });
    },
  );

  group('getTodos', () {
    test('getTodos returns 2 result.', () async {
      // given
      final expectedLength = 2;

      // when
      final result = await repository.getTodos();

      // then
      expect(result.length, expectedLength);
    });

    test('The result of getTodos has all values.', () async {
      // given
      final expectedUserId = 1;
      final expectedId = 1;
      final expectedTitle = "delectus aut autem";
      final expectedCompleted = true;

      // when
      final result = await repository.getTodos();
      final todo = result.first;

      // then
      expect(todo.userId, expectedUserId);
      expect(todo.id, expectedId);
      expect(todo.title, expectedTitle);
      expect(todo.completed, expectedCompleted);
    });

    test(
      'If an exception is thrown by dataSource, the result of getTodos is an empty list.',
      () async {
        // given
        final expectedResult = [];
        final TodoDataSource dataSource = MockTodoDataSourceImpl(
          isException: true,
        );
        final TodoRepository repository = TodoRepositoryImpl(
          dataSource: dataSource,
        );

        // when
        final result = await repository.getTodos();

        // then
        expect(result, expectedResult);
      },
    );
  });
}
