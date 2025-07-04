import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/comment/comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  final String filePath;

  CommentDataSourceImpl({required this.filePath});

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    final File jsonFile = File(filePath);
    if (await jsonFile.exists()) {
      final String jsonString = await jsonFile.readAsString();
      return (jsonDecode(jsonString) as List)
          .map((comment) => comment as Map<String, dynamic>)
          .toList();
    } else {
      return [];
    }
  }
}
