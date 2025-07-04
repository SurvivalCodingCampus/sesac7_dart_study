import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/to_do_data_source.dart';

class MockToDoDataSourceImpl implements ToDoDataSource {
  final List<Map<String, dynamic>> json = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false,
    },
    {"userId": 1, "id": 3, "title": "fugiat veniam minus", "completed": false},
    {"userId": 1, "id": 4, "title": "et porro tempora", "completed": true},
    {
      "userId": 1,
      "id": 5,
      "title":
          "laboriosam mollitia et enim quasi adipisci quia provident illum",
      "completed": false,
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    return json;
  }
}
