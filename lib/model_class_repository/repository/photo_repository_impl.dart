import 'package:modu_3_dart_study/model_class_repository/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/model_class_repository/model/photo.dart';
import 'package:modu_3_dart_study/model_class_repository/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final photoData = await _photoDataSource.getAll();

    return photoData
        .where((e) => e['albumId'] == albumId)
        .map((photo) => Photo.fromJson(photo))
        .toList();
  }
}
