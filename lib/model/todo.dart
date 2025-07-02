/*
 위 링크에서 제공되는 Json 을 todo.json 으로 저장
 todo.json 파일을 읽어서 Todo 객체로 변환하는 기능 작성
 Todo, TodoDataSourceImpl 작성
*/

const String todoJsonsourceFile = 'C:/Users/caforestle/dev/dart_study/sesac7_dart_study/lib/json/todo.json';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({required this.userId, required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

/*
  Todo(this.userId, this.id, this.title, this.completed);

  Todo.fromJson(Map<String, dynamic> json)
    : userId = json['userId'],
      id = json['id'],
      title = json['title'],
      completed = json['completed'];
*/
}