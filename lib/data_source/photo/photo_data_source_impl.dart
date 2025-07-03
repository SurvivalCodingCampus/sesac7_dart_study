import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/photo/photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String filePath;

  PhotoDataSourceImpl({required this.filePath});

  @override
  Future<List<Map<String, dynamic>>> getJsonList() async {
    final File jsonFile = File(filePath);

    if (await jsonFile.exists()) {
      final String jsonString = await jsonFile.readAsString();
      return (jsonDecode(jsonString) as List)
          .map((photo) => photo as Map<String, dynamic>)
          .toList();
    } else {
      return [];
    }
  }
}
