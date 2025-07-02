import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/data_source/todo_model.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String _todoPath;
  final String _todosPath;

  TodoDataSourceImpl({required String todoPath, required String todosPath})
    : _todoPath = todoPath,
      _todosPath = todosPath;

  Future<String> getJsonFile(String filePath) async {
    final file = File(filePath);

    if (!await file.exists()) {
      print('$filePath 파일을 찾을 수 없습니다.');
      throw DataSourceException('$filePath 파일을 찾을 수 없습니다.');
    }

    final content = await file.readAsString();

    if (content.isEmpty) {
      print('$filePath 파일이 비어있습니다.');
      throw DataSourceException('$filePath 파일이 비어있습니다.');
    }
    return content;
  }

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

class DataSourceException implements Exception {
  final String message;

  DataSourceException(this.message);

  @override
  String toString() => 'DataSourceException: $message';
}
