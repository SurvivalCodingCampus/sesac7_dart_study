import 'dart:async';

import 'package:modu_3_dart_study/17_dto_mapper/dto/photo_dto.dart';
import 'package:modu_3_dart_study/17_dto_mapper/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/17_dto_mapper/model/photo.dart';
import 'package:modu_3_dart_study/17_dto_mapper/repository/photo_repository.dart';
import 'package:modu_3_dart_study/18_result_pattern/core/network_error_for_photo.dart';
import 'package:modu_3_dart_study/18_result_pattern/core/result.dart';

import '../data_source/photo_data_source.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Photo>, NetworkErrorForPhoto>> getPhotos() async {
    try {
      final response = await _dataSource.getPhotoDtos().timeout(
        Duration(seconds: 5),
      );

      return Result.success(
        response.body.map((e) => e?.toModel() ?? PhotoDto().toModel()).toList(),
      );
    } on TimeoutException {
      return Result.error(NetworkErrorForPhoto.requestTimeout);
    } catch (e) {
      return Result.error(NetworkErrorForPhoto.unknown);
    }
  }

  @override
  Future<Result<List<Photo>, Exception>> getPhotos2() async {
    try {
      final response = await _dataSource.getPhotoDtos();

      return Result.success(
        response.body.map((e) => e?.toModel() ?? PhotoDto().toModel()).toList(),
      );
    } catch (e) {
      return Result.error(Exception('에러'));
    }
  }
}
