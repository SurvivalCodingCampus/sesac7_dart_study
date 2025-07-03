import 'package:modu_3_dart_study/data_source/todo/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';
import 'package:modu_3_dart_study/repository/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl({required TodoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Todo>> getCompletedTodos() async {
    return (await _dataSource.getTodos())
        .where((todo) => todo.completed == true)
        .toList();
  }

  @override
  Future<List<Todo>> getTodos() async {
    return await _dataSource.getTodos();
  }
}
