import 'package:modu_3_dart_study/15_model_class_repository/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/15_model_class_repository/model/photo.dart';
import 'package:modu_3_dart_study/15_model_class_repository/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      return (await _dataSource.getAll())
          .map((e) => Photo.fromJson(e))
          .where((e) => e.albumId == albumId)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
