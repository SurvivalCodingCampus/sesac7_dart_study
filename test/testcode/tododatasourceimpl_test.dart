import 'package:modu_3_dart_study/data_source/tododatasourceimpl.dart';
import 'package:modu_3_dart_study/model/todo.dart';
import 'package:test/test.dart';

void main() {
  test('간단한 JSON 을 데이터 클래스로 변환 Test', () async {
    //given(준비)
    final int userId = 1;
    final int id = 1;
    final String title = 'delectus aut autem';
    final bool completed = false;
    TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();

    //when(실행)
    try {
      Todo todo = await todoDataSourceImpl.getTodo();

      //then(검증)
      expect(todo.userId, userId);
      expect(todo.id, id);
      expect(todo.title, title);
      expect(todo.completed, completed);
    } catch (e) {
      print(e);
    }
  });

  test('Json List 를 List<Todo> 로 변환 Test', () async {
    //given(준비)
    final String title0 = 'delectus aut autem';
    final String title1 = 'fugiat veniam minus';
    final String title21 = 'distinctio vitae autem nihil ut molestias quo';
    TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();

    //when(실행)
    try {
      List<Todo> todos = await todoDataSourceImpl.getTodos();

      //then(검증)
      expect(todos[0].title, title0);
      expect(todos[2].title, title1);
      expect(todos[21].title, title21);
    } catch (e) {
      print(e);
    }
  });
}
