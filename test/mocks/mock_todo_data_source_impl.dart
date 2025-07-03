import 'package:modu_3_dart_study/data_source/todo/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  final Map<String, dynamic> todoJson = {
      "userId": 1,
      "id": 4,
      "title": "et porro tempora",
      "completed": true
  };

  final List<Map<String, dynamic>> todosJson = [
    {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": true
    },
    {
      "userId": 2,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false,
    },
    {
      "userId": 3,
      "id": 3,
      "title": "fugiat veniam minus",
      "completed": false
    },
  ];

  @override
  Future<Todo> getTodo() async {
    return Todo.fromJson(todoJson);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return todosJson
        .map((todo) => Todo.fromJson(todo))
        .toList();
  }
}
