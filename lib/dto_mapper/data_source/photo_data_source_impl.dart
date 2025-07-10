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

    try {
      final String result = await file.readAsString(); // 예외 발생 가능 지점

      return (jsonDecode(result) as List)
          .map((e) => PhotoDto.fromJson(e))
          .toList();
    } on FileSystemException catch (e) {
      print(e.message);
      return []; // 읽기 실패 시 빈 리스트 반환
    } catch (e) {
      print('예상치 못한 오류');
      return []; // 읽기 실패 시 빈 리스트 반환
    }
  }
}
