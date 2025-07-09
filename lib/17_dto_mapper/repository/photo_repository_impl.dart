import 'package:modu_3_dart_study/17_dto_mapper/dto/photo_dto.dart';
import 'package:modu_3_dart_study/17_dto_mapper/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/17_dto_mapper/model/photo.dart';
import 'package:modu_3_dart_study/17_dto_mapper/repository/photo_repository.dart';

import '../data_source/photo_data_source.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    final response = await _dataSource.getPhotoDtos();

    return response.body
        .map((e) => e?.toModel() ?? PhotoDto().toModel())
        .toList();
  }
}
