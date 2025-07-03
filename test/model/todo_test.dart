import 'package:modu_3_dart_study/model/todo.dart';
import 'package:test/test.dart';

void main() {
  final expectedUserId = 1;
  final expectedId = 1;
  final expectedTitle = 'delectus aut autem';
  final expectedCompleted = false;
  final expectedJson = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false,
  };

  group(
    'constructor',
    () {
      test(
        'When create a Todo, userId, id, title, and completed are given values.',
        () {
          // given
          // when
          final todo = Todo(
            userId: expectedUserId,
            id: expectedId,
            title: expectedTitle,
            completed: expectedCompleted,
          );

          // then
          expect(todo.userId, expectedUserId);
          expect(todo.id, expectedId);
          expect(todo.title, expectedTitle);
          expect(todo.completed, expectedCompleted);
        },
      );

      test(
        'When create a Todo with all values null, the userId, id, title, and completed are null.',
        () {
          // given
          // when
          final todo = Todo(
            userId: null,
            id: null,
            title: null,
            completed: null,
          );

          // then
          expect(todo.userId, null);
          expect(todo.id, null);
          expect(todo.title, null);
          expect(todo.completed, null);
        },
      );
    },
  );

  group('fromJson', () {
    test(
      'If the json contains all the values and create Todo.fromJson, userId, id, title, completed are the given values.',
      () {
        // given

        // when
        final todo = Todo.fromJson(expectedJson);

        // then
        expect(todo.userId, expectedUserId);
        expect(todo.id, expectedId);
        expect(todo.title, expectedTitle);
        expect(todo.completed, expectedCompleted);
      },
    );

    test(
      'If all values in the json are null and create Todo.fromJson, the userId, id, title, and completed are the given values.',
      () {
        // given
        final json = <String, dynamic>{};

        // when
        final todo = Todo.fromJson(json);

        // then
        expect(todo.userId, null);
        expect(todo.id, null);
        expect(todo.title, null);
        expect(todo.completed, null);
      },
    );
  });

  group('toJson', () {
    test(
      'If todo has all values, the result of toJson is the same as expectedJson.',
      () {
        // given
        final todo = Todo(
          userId: expectedUserId,
          id: expectedId,
          title: expectedTitle,
          completed: expectedCompleted,
        );

        // when
        final result = todo.toJson();

        // then
        expect(result, expectedJson);
      },
    );
  });

  group('copyWith', () {
    test(
      'If todo contains all values and copyWith is performed, the copied todo is a different object and has the same values.',
      () {
        // given
        final todo = Todo(
          userId: expectedUserId,
          id: expectedId,
          title: expectedTitle,
          completed: expectedCompleted,
        );

        // when
        final copied = todo.copyWith();

        // then
        expect(identical(todo, copied), isFalse);
        expect(todo == copied, isTrue);
      },
    );

    test(
      'If todo contains all the values and you do a copyWith with a new id, the copied todo will have a different id.',
      () {
        // given
        final todo = Todo(
          userId: expectedUserId,
          id: expectedId,
          title: expectedTitle,
          completed: expectedCompleted,
        );
        final newId = 2;

        // when
        final copied = todo.copyWith(id: newId);

        // then
        expect(identical(todo, copied), isFalse);
        expect(todo.userId, copied.userId);
        expect(copied.id, newId);
        expect(todo.title, copied.title);
        expect(todo.completed, copied.completed);
      },
    );
  });
}
