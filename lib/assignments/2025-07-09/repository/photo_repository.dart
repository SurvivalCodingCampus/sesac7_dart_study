import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/mapper/photo_mapper.dart';

import '../model/photo.dart';

class PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepository(this._photoDataSource);

  Future<List<Photo>> getPhotos() async {
    final jsonString = await _photoDataSource.getPhotos();
    final List<PhotoDto> photoDtos = (jsonDecode(jsonString) as List)
        .map((json) => PhotoDto.fromJson(json))
        .toList();
    return photoDtos.map((photoDto) => photoDto.toPhoto()).toList();
  }
}
