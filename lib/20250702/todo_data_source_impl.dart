import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/20250702/todo.dart';
import 'package:modu_3_dart_study/20250702/todo_data_source.dart';

import '../20250625/my_exception.dart';

class TodoDataSourceImpl implements TodoDataSource {
  String _contents = '';

  @override
  Future<Todo?> getTodo(String filePath) {
    final sourceFile = File(filePath);
    if (!sourceFile.existsSync()) throw MyException(MyException.FILE_NOT_FOUND);

    _contents = sourceFile.readAsStringSync();
    if(_contents.isEmpty) throw MyException(MyException.FILE_CONTENTS_EMPTY);

    try {
      final todoMap = jsonDecode(_contents);
      return Future.value(Todo.fromMap(todoMap));
    } catch (e) {
      return Future.value(null);
    }
  }
}
