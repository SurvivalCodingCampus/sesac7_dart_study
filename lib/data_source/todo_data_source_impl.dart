import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    final file = File('assets/todo.json');
    final jsonString = await file.readAsString();
    final json = jsonDecode(jsonString);
    return Todo.fromJson(json);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final file = File('assets/todos.json');
    final jsonString = await file.readAsString();
    final json = jsonDecode(jsonString);
    return (json as List).map((e) => Todo.fromJson(e)).toList();
  }
}
