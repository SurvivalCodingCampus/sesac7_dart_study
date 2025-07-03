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

  //Json List 를 List<Todo> 로 변환
  @override
  Future<List<Todo>> getTodos() async {
    final file = File(todoJsonListsourceFile);
    String jsonString = file.readAsStringSync();
    List<dynamic> list = jsonDecode(jsonString);
    Todos todos = Todos.fromJson(list);
    return todos.todos;
  }
}

void main() {}
