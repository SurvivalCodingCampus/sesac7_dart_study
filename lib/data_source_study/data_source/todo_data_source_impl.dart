import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/data_source_study/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    try {
      final Map<String, dynamic> json = jsonDecode(
        File('lib/data_source_study/todo.json').readAsStringSync(),
      );
      final Todo todo = Todo.fromJson2(json);
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
                File('lib/data_source_study/todos.json').readAsStringSync(),
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

void main() async {
  TodoDataSourceImpl impl = TodoDataSourceImpl();
  List<Todo> a = await impl.getTodos();
  print(a.toString());
}
