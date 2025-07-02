import 'package:modu_3_dart_study/assignments/data_source/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}
