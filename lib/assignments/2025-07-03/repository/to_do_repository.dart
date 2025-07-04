import 'package:modu_3_dart_study/assignments/2025-07-03/model/to_do.dart';

abstract interface class ToDoRepository {
  Future<List<ToDo>> getTodos();
  Future<List<ToDo>> getCompletedTodos();
}
