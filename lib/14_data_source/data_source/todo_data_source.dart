import '../model/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();

  Future<List<Todo>> getTodos();
}
