import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/todo_data_source.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  final List<Map<String, dynamic>> json = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": true,
    },
    {"userId": 1, "id": 3, "title": "fugiat veniam minus", "completed": true},
  ];

  @override
  Future<List<Map<String, dynamic>>> getAllTodos() async {
    return json;
  }
}
