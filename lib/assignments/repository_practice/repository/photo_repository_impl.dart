import 'package:modu_3_dart_study/assignments/repository_practice/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/model/photo.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  const PhotoRepositoryImpl(this._dataSource);

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
