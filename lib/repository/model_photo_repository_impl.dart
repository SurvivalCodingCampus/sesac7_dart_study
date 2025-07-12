import 'package:modu_3_dart_study/data_source/local/photo_data_source.dart';
import 'package:modu_3_dart_study/dto/photo_dto.dart';
import 'package:modu_3_dart_study/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/model/model_photo.dart';
import 'package:modu_3_dart_study/repository/model_photo_repository.dart';

import '../core/response.dart';

class ModelPhotoRepositoryImpl implements ModelPhotoRepository {
  final PhotoDataSource _photoDataSource;

  ModelPhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<ModelPhoto>> getPhotos() async {
    // static 한 데이터 가져오기
    final result = await _photoDataSource.getAllData();

    // List<PhotoDto>
    final photoDtoList = result.map((e) => PhotoDto.fromJson(e)).toList();

    //
    final modelPhotoList = photoDtoList
        .map((PhotoDto dto) => dto.toModel())
        .toList();

    return modelPhotoList;
  }
}
