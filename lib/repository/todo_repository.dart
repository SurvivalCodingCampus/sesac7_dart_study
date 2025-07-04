import 'package:modu_3_dart_study/model/todo.dart';

abstract interface class TodoRepository{
  Future<List<Todo>> getTodos(num userId);
  Future<List<Todo>> getCompletedTodos(num userId);
}