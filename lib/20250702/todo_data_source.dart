import 'package:modu_3_dart_study/20250702/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo?> getTodo(String filePath);
  Future<List<Todo?>> getTodos(String filePath);
}