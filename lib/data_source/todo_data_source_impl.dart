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
}

void main() async {
  TodoDataSourceImpl impl = TodoDataSourceImpl();
  print(await impl.getTodo());
}