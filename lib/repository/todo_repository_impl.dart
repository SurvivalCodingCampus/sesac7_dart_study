import 'package:modu_3_dart_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';
import 'package:modu_3_dart_study/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl({required TodoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final todos = await _dataSource.getTodos();
      return todos.where((todo) => todo.completed == true).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      return await _dataSource.getTodos();
    } catch (e) {
      return [];
    }
  }
}
