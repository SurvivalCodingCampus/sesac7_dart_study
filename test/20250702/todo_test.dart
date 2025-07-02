import 'package:modu_3_dart_study/20250702/todo.dart';
import 'package:modu_3_dart_study/20250702/todo_data_source_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('', () {
    test('todo 데이터 가져오기', () async {
      TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();
      final todo = await todoDataSourceImpl.getTodo('todo.json');

      expect(todo , isA<Todo>());
    });

    test('todo 리스트 데이터 가져오기', () async {
      TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl();
      final todos = await todoDataSourceImpl.getTodos('todo_list.json');

      expect(todos , isA<List<Todo>>());
      expect(todos.length, 200);
    });
  });
}
