import 'dart:convert';

import 'package:modu_3_dart_study/data_source_study/model/todo.dart';
import 'package:test/test.dart';

void main() {
  group('Todo Test', () {
    test('생성자 테스트', () {
      // given
      final int testUserId = 1;
      final int testId = 1;
      final String testTitle = 'delectus aut autem';
      final bool testCompleted = false;

      final Todo testTodo = Todo(
        userId: testUserId,
        id: testId,
        title: testTitle,
        completed: testCompleted,
      );

      // when & then
      expect(testTodo.userId, equals(testUserId));
      expect(testTodo.id, equals(testId));
      expect(testTodo.title, equals(testTitle));
      expect(testTodo.completed, equals(testCompleted));
    });

    test('userId 값이 1보다 작을 때 기본 값으로 설정되는가?', () {
      // given
      // 경계값 설정
      final int testUserId1 = -1;
      final int testUserId2 = 0;
      final int testUserId3 = 1;

      final int testId = 1;
      final String testTitle = 'delectus aut autem';
      final bool testCompleted = false;

      final Todo testTodo1 = Todo(
        userId: testUserId1,
        id: testId,
        title: testTitle,
        completed: testCompleted,
      );
      final Todo testTodo2 = Todo(
        userId: testUserId2,
        id: testId,
        title: testTitle,
        completed: testCompleted,
      );
      final Todo testTodo3 = Todo(
        userId: testUserId3,
        id: testId,
        title: testTitle,
        completed: testCompleted,
      );

      // when & then
      expect(testTodo1.userId, equals(Todo.defaultIdValue));
      expect(testTodo2.userId, equals(Todo.defaultIdValue));
      expect(testTodo3.userId, equals(testUserId3));
    });

    test('id 값이 1보다 작을 때 기본 값으로 설정되는가?', () {
      // given
      // 경계값 설정
      final int testId1 = -1;
      final int testId2 = 0;
      final int testId3 = 1;

      final int testUserId = 1;
      final String testTitle = 'delectus aut autem';
      final bool testCompleted = false;

      final Todo testTodo1 = Todo(
        userId: testUserId,
        id: testId1,
        title: testTitle,
        completed: testCompleted,
      );
      final Todo testTodo2 = Todo(
        userId: testUserId,
        id: testId2,
        title: testTitle,
        completed: testCompleted,
      );
      final Todo testTodo3 = Todo(
        userId: testUserId,
        id: testId3,
        title: testTitle,
        completed: testCompleted,
      );

      // when & then
      expect(testTodo1.id, equals(Todo.defaultIdValue));
      expect(testTodo2.id, equals(Todo.defaultIdValue));
      expect(testTodo3.id, equals(testId3));
    });

    test('오류 없는 형태의 json 데이터를 받았을 때 정확한 역직렬화가 가능한가?', () {
      // given
      final String testMessage =
          '''{"userId":1,"id":1,"title":"delectus aut autem","completed":false}''';
      final Todo testTodo = Todo.fromJson(jsonDecode(testMessage));

      // when & then
      expect(testTodo.userId, equals(1));
      expect(testTodo.id, equals(1));
      expect(testTodo.title, equals('delectus aut autem'));
      expect(testTodo.completed, equals(false));
    });

    test('객체를 json 데이터 형태로 정확한 직렬화가 가능한가?', () {
      // given
      // testMessage는 json 파일에서 그대로 긁어와 공백만 없앤 문자열
      final String testMessage =
          '''{"userId":1,"id":1,"title":"delectus aut autem","completed":false}''';

      final int testUserId = 1;
      final int testId = 1;
      final String testTitle = 'delectus aut autem';
      final bool testCompleted = false;

      final Todo testTodo = Todo(
        userId: testUserId,
        id: testId,
        title: testTitle,
        completed: testCompleted,
      );

      final String encodedString = jsonEncode(testTodo.toJson());

      // when & then
      expect(encodedString, equals(testMessage));
    });
  });
}
