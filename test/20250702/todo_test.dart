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
  });
}
