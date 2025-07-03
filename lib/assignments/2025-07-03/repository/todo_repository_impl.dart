import 'package:modu_3_dart_study/assignments/2025-07-03/model/todo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/todo_repository.dart';

import '../data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final todosMapList = await _todoDataSource.getAllTodos();
      return todosMapList.map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final todosMapList = await _todoDataSource.getAllTodos();
      return todosMapList
          .map((e) => Todo.fromJson(e))
          .where((todo) => todo.completed == true)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
