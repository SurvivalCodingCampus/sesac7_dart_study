import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/tododatasource.dart';

import '../model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {

    final file = File(todoJsonsourceFile);

    String jsonString = file.readAsStringSync();

    Map<String, dynamic> json = jsonDecode(jsonString);

    Todo todo = Todo.fromJson(json);

    return todo;
  }
}
