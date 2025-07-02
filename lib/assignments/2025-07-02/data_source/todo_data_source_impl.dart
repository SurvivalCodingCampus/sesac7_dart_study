import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-07-02/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-02/models/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final file = File('lib/assignments/2025-07-02/todo.json');
      final fileString = file.readAsStringSync();

      Todo todo = Todo.fromMap(jsonDecode(fileString));
      return todo;
    } catch (e) {
      throw (e);
    }
  }
}
