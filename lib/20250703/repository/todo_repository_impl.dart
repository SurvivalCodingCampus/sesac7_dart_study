
import 'package:modu_3_dart_study/20250703/repository/todo_repository.dart';

import '../../20250703/model/todo.dart';
import '../../20250703/data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final result = await _todoDataSource.getAll();
      return result
          .map((e) => Todo.fromJson(e))
          .where((e) => e.completed)
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final result = await _todoDataSource.getAll();
      return result.map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
