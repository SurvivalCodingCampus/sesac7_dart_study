import 'package:modu_3_dart_study/model/todo.dart';
import 'package:modu_3_dart_study/repository/repository/todo_repository.dart';

import '../data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final results = await _todoDataSource.getTodo();
      return results.map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      print('getTodos $e');
      return [];
    }
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final results = await _todoDataSource.getCompletedTodo();
      return results.map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      print('getCompletedTodos $e');
      return [];
    }
  }
}
