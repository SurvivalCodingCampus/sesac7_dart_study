import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/dto_mapper/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/dto_mapper/dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String _defaultFilePath;

  PhotoDataSourceImpl({String? defaultFilePath})
    : _defaultFilePath = defaultFilePath ?? 'lib/dto_mapper/data.json';

  @override
  Future<List<PhotoDto>> getPhotos() async {
    final File file = File(_defaultFilePath);
    final String result = file.readAsStringSync();

    return (jsonDecode(result) as List)
        .map((e) => PhotoDto.fromJson(e))
        .toList();
  }
}

void main() async {
  PhotoDataSource a = PhotoDataSourceImpl(
    defaultFilePath: 'lib/dto_mapper/data.json',
  );
  final result = await a.getPhotos();

  print(result);
}
