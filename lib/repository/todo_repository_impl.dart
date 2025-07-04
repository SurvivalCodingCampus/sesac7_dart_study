import 'package:modu_3_dart_study/data_source/local/data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';
import 'package:modu_3_dart_study/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository{

  final DataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<List<Todo>> getTodos(num userId) async{
    try {
      final results = await _dataSource.getAll();
      return results
        .map((e) => Todo.fromJson(e))
        .where((todo) => todo.userId == userId)
        .toList();
    } catch (e) {
      return [];
    }
  }
  
  @override
  Future<List<Todo>> getCompletedTodos(num userId) async {
    try {
      final results = await _dataSource.getAll();
      return results
        .map((e) => Todo.fromJson(e))
        .where((todo) => todo.userId == userId)
        .where((todo) => todo.completed == true)
        .toList();
    } catch (e) {
      return [];
    }
  }
}