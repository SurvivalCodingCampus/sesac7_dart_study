import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/album/album_data_source.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  final String _filePath;

  AlbumDataSourceImpl({required String filePath}) : _filePath = filePath;

  @override
  Future<List<Map<String, dynamic>>> getAllAlbums() async {
    final File jsonFile = File(_filePath);
    if (await jsonFile.exists()) {
      final String jsonString = await jsonFile.readAsString();
      return (jsonDecode(jsonString) as List)
          .map((album) => album as Map<String, dynamic>)
          .toList();
    } else {
      return [];
    }
  }
}
