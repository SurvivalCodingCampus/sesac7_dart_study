import 'dart:convert';

import 'package:modu_3_dart_study/assignments/data_source/data_source_exception.dart';
import 'package:modu_3_dart_study/assignments/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/data_source/todo_model.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String _todoPath;
  final String _todosPath;

  TodoDataSourceImpl({required String todoPath, required String todosPath})
    : _todoPath = todoPath,
      _todosPath = todosPath;

  @override
  Future<Todo> getTodo() async {
    final jsonString = await getJsonFile(_todoPath);
    final jsonMap = jsonDecode(jsonString);

    return Todo.fromJson(jsonMap);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final jsonString = await getJsonFile(_todosPath);
    final jsonMap = jsonDecode(jsonString) as List;

    return jsonMap.map((jsonMap) => Todo.fromJson(jsonMap)).toList();
  }
}
