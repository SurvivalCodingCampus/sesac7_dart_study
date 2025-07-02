import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    final File jsonFile = File('json_data/todo.json');
    if (!await jsonFile.exists()) {
      throw Exception('todo Json 파일이 없습니다.');
    }

    final String jsonString = await jsonFile.readAsString();
    if (jsonString.isEmpty) {
      throw Exception('todos Json 파일이 비어있습니다.');
    }

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return Todo.fromJson(jsonMap);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final File jsonFile = File('json_data/todos.json');
    if (!await jsonFile.exists()) {
      throw Exception('todos Json 파일이 없습니다.');
    }

    final String jsonString = await jsonFile.readAsString();
    if (jsonString.isEmpty) {
      throw Exception('todos Json 파일이 비어있습니다.');
    }

    final jsonList = jsonDecode(jsonString);
    final todoObjList = (jsonList as List)
        .map(
          (todoJsonMap) => Todo.fromJson(todoJsonMap as Map<String, dynamic>),
        )
        .toList();

    return todoObjList;
  }
}
