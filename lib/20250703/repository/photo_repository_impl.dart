import 'package:modu_3_dart_study/20250703/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/20250703/model/photo.dart';
import 'package:modu_3_dart_study/20250703/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;


  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final result = await _dataSource.getAll();
      return result
          .map((e) => Photo.fromJson(e))
          .where((photo) => photo.albumId == albumId)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
