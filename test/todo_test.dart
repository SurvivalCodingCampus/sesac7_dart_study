import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:modu_3_dart_study/todo.dart';

void main() async {

  final todoInstance = TodoDataSourceImpl(); // 인스턴스 생성
  final todo01 = await todoInstance.getToDo();

  final todoList = await todoInstance.getToDos(); // list 생성

  group('단일 todo 테스트',() {
      // await 없이 호출하면 결과를 기다리지 않고 그냥 객체 자체를 반환함
      // 값이 준비 안된 상태

      test('Todo 객체로 변환된 인스턴스 값을 확인 할 수 있다', (){

        expect(todo01.userId, equals(1));
        expect(todo01.id, equals(1));
        expect(todo01.title, equals("delectus aut autem"));
        expect(todo01.completed, equals(false));
      });

      test('toJson 으로 비교', (){
        final todoMap = todo01.toJson();
        final jsonFile = File('lib/assets/todo.json').readAsStringSync();
        Map<String, dynamic> todoReMap = jsonDecode(jsonFile);

        expect(todoMap, equals(todoReMap));
      });
    }    
  );

  group('todo list 테스트', () {

    final todoList01 = todoList[1];
    test('List<Todo> 객체로 변환된 인스턴스 값을 확인 할 수 있다', (){
      expect(todoList01.userId, equals(1));
      expect(todoList01.id, equals(2));
      expect(todoList01.title, equals("quis ut nam facilis et officia qui"));
      expect(todoList01.completed, equals(false));
    });
  });
  
}