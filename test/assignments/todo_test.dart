import 'package:modu_3_dart_study/assignments/data_source/todo_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  group('TodoDataSourceImpl 클래스 테스트 (실제 파일 사용)', () {
    final validDataSource = TodoDataSourceImpl(
      todoPath: 'lib/assignments/data_source/data/todo.json',
      todosPath: 'lib/assignments/data_source/data/todos.json',
    );

    final invalidDataSource = TodoDataSourceImpl(
      todoPath: 'invalid_file.json',
      todosPath: '',
    );

    group('성공 케이스', () {
      test('todo.json을 받고 데이터 출력', () async {
        final todo = await validDataSource.getTodo();

        expect(todo.id, 1);
        expect(todo.title, 'delectus aut autem');
        expect(todo.completed, false);
      });

      test('todos.json을 받고 첫번째 데이터 출력 ', () async {
        final todos = await validDataSource.getTodos();

        expect(todos.isNotEmpty, isTrue);
        expect(todos.first.id, 1);
        expect(todos.first.title, 'delectus aut autem');
        expect(todos.first.completed, false);
      });
    });

    group('실패 케이스', () {
      test('존재하지 않는 파일을 읽으면 DataSourceException', () {
        expect(
          () async => await invalidDataSource.getTodo(),
          throwsA(isA<DataSourceException>()),
        );
      });

      test('비어있는 경로를 전달받으면 DataSourceException', () {
        expect(
          () async => await invalidDataSource.getTodos(),
          throwsA(isA<DataSourceException>()),
        );
      });
    });
  });
}
