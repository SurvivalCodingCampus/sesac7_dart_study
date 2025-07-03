import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/todo/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/model/todo.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('TodoDataSourceImpl Test', () {
    test('getTodo 메서드 return 객체 검증', () async {
      final File jsonFile = File('json_data/todo.json');
      final String jsonString = await jsonFile.readAsString();
      final Todo jsonGetTodo = Todo.fromJson(jsonDecode(jsonString));

      final TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();
      final Todo implGetTodo = await todoDataSourceImpl.getTodo();

      expect(jsonGetTodo.userId, equals(implGetTodo.userId));
      expect(jsonGetTodo.id, equals(implGetTodo.id));
      expect(jsonGetTodo.title, equals(implGetTodo.title));
      expect(jsonGetTodo.completed, equals(implGetTodo.completed));
    });
    test('getTodos 메서드 return 값 list empty', () async {
      final TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();
      final List<Todo> totoList = await todoDataSourceImpl.getTodos();

      expect(totoList.isNotEmpty, isTrue);
    });

    test('getTodos 메서드 return 값 list 요소 객체 검증', () async {
      final File jsonFile = File('json_data/todos.json');
      final String jsonString = await jsonFile.readAsString();
      final List jsonList = jsonDecode(jsonString) as List;
      final Todo jsonGetTodo = Todo.fromJson(jsonList.first);

      final TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();
      final List<Todo> todoList = await todoDataSourceImpl.getTodos();
      final implGetTodo = todoList.first;

      expect(jsonGetTodo.userId, equals(implGetTodo.userId));
      expect(jsonGetTodo.id, equals(implGetTodo.id));
      expect(jsonGetTodo.title, equals(implGetTodo.title));
      expect(jsonGetTodo.completed, equals(implGetTodo.completed));
    });
  });
}
