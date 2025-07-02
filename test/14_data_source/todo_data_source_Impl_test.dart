import 'package:modu_3_dart_study/14_data_source/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/14_data_source/model/todo.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final userId = 1;
  final id = 1;
  final title = 'delectus aut autem';
  final completed = false;

  test('TodoDataSourceImpl 테스트', () async {
    final TodoDataSourceImpl dataSource = TodoDataSourceImpl();
    final Todo todo = await dataSource.getTodo();

    expect(todo.userId, equals(userId));
    expect(todo.id, equals(id));
    expect(todo.title, equals(title));
    expect(todo.completed, equals(completed));
  });
}
