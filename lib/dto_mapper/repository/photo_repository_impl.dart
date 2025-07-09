import 'package:modu_3_dart_study/dto_mapper/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/dto_mapper/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/dto_mapper/dto/photo_dto.dart';
import 'package:modu_3_dart_study/dto_mapper/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/dto_mapper/model/photo.dart';
import 'package:modu_3_dart_study/dto_mapper/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotoModel() async {
    final List<PhotoDto> result = await _photoDataSource.getPhotos();

    return result.map((PhotoDto dto) => dto.toPhoto()).toList();
  }
}

void main() async {
  PhotoRepository a = PhotoRepositoryImpl(
    photoDataSource: PhotoDataSourceImpl(),
  );

  final result = await a.getPhotoModel();
  print(result);
}
