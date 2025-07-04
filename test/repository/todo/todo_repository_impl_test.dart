import 'package:modu_3_dart_study/data_source/todo/todo_data_source.dart';
import 'package:modu_3_dart_study/repository/todo/todo_repository.dart';
import 'package:modu_3_dart_study/repository/todo/todo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_todo_data_source_impl.dart';

void main() {
  group('TodoRepositoryImpl Test', () {
    test('getTodos Test', () async {
      final TodoDataSource mockTodoDataSource = MockTodoDataSourceImpl();
      final TodoRepository todoRepository = TodoRepositoryImpl(dataSource: mockTodoDataSource);

      expect((await todoRepository.getTodos()).length, equals(3));
      expect((await todoRepository.getTodos()).first.userId, equals(1));
      expect((await todoRepository.getTodos()).first.id, equals(1));
      expect((await todoRepository.getTodos()).first.title, equals('delectus aut autem'));
      expect((await todoRepository.getTodos()).first.completed, equals(true));
    });

    test('getCompletedTodos 테스트', () async {
      final TodoDataSource mockTodoDataSource = MockTodoDataSourceImpl();
      final TodoRepository todoRepository = TodoRepositoryImpl(dataSource: mockTodoDataSource);

      expect((await todoRepository.getCompletedTodos()).length, equals(1));
      expect((await todoRepository.getCompletedTodos()).first.userId, equals(1));
      expect((await todoRepository.getCompletedTodos()).first.id, equals(1));
      expect((await todoRepository.getCompletedTodos()).first.title, equals('delectus aut autem'));
      expect((await todoRepository.getCompletedTodos()).first.completed, equals(true));
    });
  });
}