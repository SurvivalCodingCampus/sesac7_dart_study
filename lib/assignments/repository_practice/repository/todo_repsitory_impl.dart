import 'package:modu_3_dart_study/assignments/repository_practice/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/model/todo.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final todos = (await _dataSource.getAll())
          .map((data) => Todo.fromJson(data))
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
          .map((data) => Todo.fromJson(data))
          .where((todo) => todo.completed)
          .toList();
      return completedTodos;
    } catch (e) {
      return [];
    }
  }
}
