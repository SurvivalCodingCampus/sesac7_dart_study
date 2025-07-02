import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-07-02/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-02/models/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final file = File('lib/assignments/2025-07-02/todo.json');
      final fileString = file.readAsStringSync();

      Todo todo = Todo.fromJson(jsonDecode(fileString));
      return todo;
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final file = File('lib/assignments/2025-07-02/todos.json');
      final fileString = file.readAsStringSync();

      List<Todo> todos = (jsonDecode(fileString) as List)
          .map((e) => Todo.fromJson(e))
          .toList();
      return todos;
    } catch (e) {
      throw (e);
    }
  }
}

void main() async {
  Todo todo1 = await TodoDataSourceImpl().getTodo();
  print('id: ${todo1.id}');
  print('userId: ${todo1.userId}');
  print('title: ${todo1.title}');
  print('completed: ${todo1.completed}');

  List<Todo> todos = await TodoDataSourceImpl().getTodos();
  print('------------------------');
  print('runtimeType: ${todos.runtimeType}');
  print('length: ${todos.length}');
  print('id: ${todos[0].id}');
  print('userId: ${todos[0].userId}');
  print('title: ${todos[0].title}');
  print('completed: ${todos[0].completed}');
}
