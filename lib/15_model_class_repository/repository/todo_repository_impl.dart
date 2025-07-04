import 'package:modu_3_dart_study/15_model_class_repository/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/model/todo.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final todos = (await _dataSource.getAll())
          .map((e) => Todo.fromJson(e))
          .toList();
      return todos;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final completedTodos = (await _dataSource.getAll())
          .map((e) => Todo.fromJson(e))
          .where((e) => e.completed)
          .toList();
      return completedTodos;
    } catch (e) {
      return [];
    }
  }
}
