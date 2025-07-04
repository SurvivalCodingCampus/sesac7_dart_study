import 'package:modu_3_dart_study/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<List<Todo>> getCompletedTodos();
}
