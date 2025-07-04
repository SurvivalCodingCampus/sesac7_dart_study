import 'package:modu_3_dart_study/assignments/2025-07-03/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final List<Map<String, dynamic>> results = await _dataSource.getAll();
      return results
          .map((e) => Photo.fromJson(e))
          .where((photo) => photo.albumId == albumId)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
