import 'dart:convert';

import 'package:modu_3_dart_study/14_data_source/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/14_data_source/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/14_data_source/model/todo.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final userId = 1;
  final id = 1;
  final title = 'delectus aut autem';
  final completed = false;
  final TodoDataSource dataSource = TodoDataSourceImpl();
  final testJsonString = '''
  [
    {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    },
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false
    },
    {
      "userId": 1,
      "id": 3,
      "title": "fugiat veniam minus",
      "completed": false
    },
    {
      "userId": 1,
      "id": 4,
      "title": "et porro tempora",
      "completed": true
    },
    {
      "userId": 1,
      "id": 5,
      "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
      "completed": false
    }
  ]
  ''';

  group('TodoDataSourceImpl 테스트', () {
    test('TodoDataSourceImpl getTodo() 테스트', () async {
      final Todo todo = await dataSource.getTodo();

      expect(todo.userId, equals(userId));
      expect(todo.id, equals(id));
      expect(todo.title, equals(title));
      expect(todo.completed, equals(completed));
    });

    test('TodoDataSourceImpl getTodos() 테스트', () async {
      final List<Todo> todos = (await dataSource.getTodos()).sublist(0, 5);
      final List<Todo> testTodos = (jsonDecode(testJsonString) as List)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();

      expect(todos, equals(testTodos));
    });
  });
}
