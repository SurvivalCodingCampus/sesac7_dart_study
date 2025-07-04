import 'package:modu_3_dart_study/model_class_repository/data_source/todo_data_source.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  final List<Map<String, dynamic>> json = [
    {
      "userId": 2,
      "id": 24,
      "title": "adipisci non ad dicta qui amet quaerat doloribus ea",
      "completed": false,
    },
    {
      "userId": 2,
      "id": 25,
      "title": "voluptas quo tenetur perspiciatis explicabo natus",
      "completed": true,
    },
    {"userId": 2, "id": 26, "title": "aliquam aut quasi", "completed": true},
    {
      "userId": 2,
      "id": 27,
      "title": "veritatis pariatur delectus",
      "completed": true,
    },
    {
      "userId": 2,
      "id": 28,
      "title": "nesciunt totam sit blanditiis sit",
      "completed": false,
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    return json;
  }
}
