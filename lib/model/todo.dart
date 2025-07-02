/*
 위 링크에서 제공되는 Json 을 todo.json 으로 저장
 todo.json 파일을 읽어서 Todo 객체로 변환하는 기능 작성
 Todo, TodoDataSourceImpl 작성
*/

const String todoJsonsourceFile =
    'C:/Users/caforestle/dev/dart_study/sesac7_dart_study/lib/json/todo.json';

const String todoJsonListsourceFile =
    'C:/Users/caforestle/dev/dart_study/sesac7_dart_study/lib/json/todos.json';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

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

class Todos {
  final List<Todo> todos;

  Todos(this.todos);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todos &&
          runtimeType == other.runtimeType &&
          todos == other.todos;

  @override
  int get hashCode => todos.hashCode;

  Todos copyWith({
    List<Todo>? todos,
  }) {
    return Todos(
      todos ?? this.todos,
    );
  }

  factory Todos.fromJson(List<dynamic> list) {
    return Todos(list.map((e) => Todo.fromJson(e)).toList());
  }
}
