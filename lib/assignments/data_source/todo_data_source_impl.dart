import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/data_source/todo.dart';
import 'package:modu_3_dart_study/assignments/data_source/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String _todoPath;

  TodoDataSourceImpl({required String todoPath}) : _todoPath = todoPath;

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
}

class DataSourceException implements Exception {
  final String message;

  DataSourceException(this.message);

  @override
  String toString() => 'DataSourceException: $message';
}
