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
}
