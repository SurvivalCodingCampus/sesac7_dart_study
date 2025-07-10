import 'package:modu_3_dart_study/20250709/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/20250709/model/photo.dart';
import 'package:modu_3_dart_study/20250709/dto/photo_dto.dart';
import 'package:modu_3_dart_study/20250709/mapper/photo_mapper.dart';

import '../../20250709/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository{

  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhoto() async {
    try {
      final result = await _photoDataSource.getAllData();
      final photos = result.map((e) => PhotoDto.fromJson(e)).map((e) => e.toPhoto()).toList();

      return photos;

    } catch (e) {
      return [];
    }
  }

}
