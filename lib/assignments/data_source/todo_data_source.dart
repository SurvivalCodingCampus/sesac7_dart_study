import 'package:modu_3_dart_study/assignments/data_source/todo_model.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();

  Future<List<Todo>> getTodos();
}
