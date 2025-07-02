import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/14_data_source/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/14_data_source/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    final Map<String, dynamic> json = jsonDecode(
      File('todo.json').readAsStringSync(),
    );

    return Todo.fromJson(json);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final List<Todo> todos =
        (jsonDecode(
                  File('todos.json').readAsStringSync(),
                )
                as List)
            .map((e) => Todo.fromJson(e as Map<String, dynamic>))
            .toList();

    return todos;
  }
}
