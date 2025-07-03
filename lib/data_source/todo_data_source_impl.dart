import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';

//todo는 무결해야함. 데이터에 이상이 있으면 todo만들지 않는다.
class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Todo>> getTodoList() async {
    final file = File('asset/todo_list.json');
    final jsonString = file.readAsStringSync();

    final list = jsonDecode(jsonString) as List;
    print(list.length);

    List<Todo> todoList = [];

    for (var map in list) {
      try {
        final todo = getTodo(map);
        todoList.add(todo);
      } catch (e) {
        print(e);
      }
    }

    return todoList;
  }

  Todo getTodo(Map map) {
    final userId = map['userId'];
    final id = map['id'];
    final title = map['title'];
    final completed = map['completed'];

    if (userId == null || userId is! int) {
      throw Exception('userId 에러');
    }
    if (id == null || id is! int) {
      throw Exception('id 에러');
    }
    if (title == null || title.isEmpty || title is! String) {
      throw Exception('title 에러');
    }
    if (completed == null || completed is! bool) {
      throw Exception('completed 에러');
    }

    return Todo(
      userId: userId,
      id: id,
      title: title,
      completed: completed,
    );
  }
}

void main() async {
  final todoDataSourceImpl = TodoDataSourceImpl();
  final list = await todoDataSourceImpl.getTodoList();

  print(list.length);
  print(list);
}
