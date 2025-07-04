import 'package:modu_3_dart_study/250703/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/250703/model/todo.dart';
import 'package:modu_3_dart_study/250703/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final list = await _todoDataSource.getTodos();
    return list.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final list = await _todoDataSource.getTodos();
    return list
        .map((e) => Todo.fromJson(e))
        .where((e) => e.completed != null && e.completed!)
        .toList();
  }
}
