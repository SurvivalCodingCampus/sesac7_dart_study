import 'package:modu_3_dart_study/model_class_repository/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/model/todo.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  const TodoRepositoryImpl({required TodoDataSource todoDataSource})
    : _todoDataSource = todoDataSource;

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final result = await _todoDataSource.getAll();

    return result
        .where((e) => e['completed'] == true)
        .map((todo) => Todo.fromJson(todo))
        .toList();
  }

  @override
  Future<List<Todo>> getTodos() async {
    final result = await _todoDataSource.getAll();

    return result.map((todo) => Todo.fromJson(todo)).toList();
  }
}
