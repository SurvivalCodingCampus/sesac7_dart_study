import 'package:modu_3_dart_study/250709/homework2/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/250709/homework2/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/250709/homework2/repository/photo_repository.dart';

import '../data_source/photo_data_source.dart';
import '../model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    return (await _dataSource.getPhotos()).map((e) => e.toModel()).toList();
  }
}

void main() async {
  final photoDataSource = PhotoDataSourceImpl();
  final photoRepository = PhotoRepositoryImpl(photoDataSource);
  (await photoRepository.getPhotos()).forEach(
    (Photo e) => print(e.toString()),
  );
}
