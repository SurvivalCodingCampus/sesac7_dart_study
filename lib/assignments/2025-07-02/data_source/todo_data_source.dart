import 'package:modu_3_dart_study/assignments/2025-07-02/models/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}
