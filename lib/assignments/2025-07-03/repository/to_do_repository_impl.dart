import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/to_do_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/to_do.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/to_do_repository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final ToDoDataSource _dataSource;

  ToDoRepositoryImpl(this._dataSource);

  @override
  Future<List<ToDo>> getCompletedTodos() async {
    try {
      final List<Map<String, dynamic>> listOfToDoMap = await _dataSource
          .getAll();

      return listOfToDoMap
          .map((e) => ToDo.fromJson(e))
          .where((toDo) => toDo.completed)
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<ToDo>> getTodos() async {
    try {
      final List<Map<String, dynamic>> listOfToDoMap = await _dataSource
          .getAll();

      return listOfToDoMap.map((e) => ToDo.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
