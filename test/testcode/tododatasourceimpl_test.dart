import 'package:modu_3_dart_study/data_source/tododatasourceimpl.dart';
import 'package:modu_3_dart_study/model/todo.dart';
import 'package:test/test.dart';

void main() {
  final int userId = 1;
  final int id = 1;
  final String title = 'delectus aut autem';
  final bool completed = false;

  test('간단한 JSON 을 데이터 클래스로 변환 Test', () async {
    //given(준비)
    TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();

    //when(실행)
    try{
    Todo todo = await todoDataSourceImpl.getTodo();

    //then(검증)
    expect(todo.userId, userId);
    expect(todo.id, id);
    expect(todo.title, title);
    expect(todo.completed, completed);

    }catch (e){
      print(e);
    }

  });
}
