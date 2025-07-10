import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  List<Photo> getPhotos() {
    final listOfDto = _dataSource.getPhotoDTOs();
    final listOfPhoto = listOfDto.map((e) => e.toPhoto());
    final filteredList = listOfPhoto
        .where((e) => e.id != -1 && e.createdAt != DateTime(0, 1, 1))
        .toList();

    return filteredList;
  }
}
