import 'package:modu_3_dart_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  final jsons = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": true},
    {
      "userId": 2,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false,
    },
  ];
  final bool? isException;

  MockTodoDataSourceImpl({this.isException});

  @override
  Future<Todo> getTodo() async {
    if (isException != null && isException!) {
      throw Exception('Fail to get todos');
    }

    return Todo.fromJson(jsons[0]);
  }

  @override
  Future<List<Todo>> getTodos() async {
    if (isException != null && isException!) {
      throw Exception('Fail to get todos');
    }

    return jsons.map(Todo.fromJson).toList();
  }
}
