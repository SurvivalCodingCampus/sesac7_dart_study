import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/data_source_study/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  String _todoFilePath = 'lib/data_source_study/todo.json';
  String _todosFilePath = 'lib/data_source_study/todos.json';

  // getter
  String get todoFilePath => _todoFilePath;

  String get todosFilePath => _todosFilePath;

  // setter
  set todoFilePath(String todoFilePath) {
    if (todoFilePath.isEmpty) {
      throw Exception('파일 경로를 입력해야 합니다.');
    }
    _todoFilePath = todoFilePath;
  }

  set todosFilePath(String todosFilePath) {
    if (todosFilePath.isEmpty) {
      throw Exception('파일 경로를 입력해야 합니다.');
    }
    _todosFilePath = todosFilePath;
  }

  @override
  Future<Todo> getTodo() async {
    try {
      final Map<String, dynamic> json = jsonDecode(
        File(todoFilePath).readAsStringSync(),
      );
      final Todo todo = Todo.fromJson(json);
      return todo;
    } on FileSystemException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('예상치 못한 오류');
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final List<dynamic> json =
          jsonDecode(
                File(todosFilePath).readAsStringSync(),
              )
              as List<dynamic>;
      final List<Todo> result = json.map((e) => Todo.fromJson(e)).toList();
      return result;
    } on FileSystemException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('예상치 못한 오류');
    }
  }
}
