import 'package:modu_3_dart_study/repository/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/repository/model/photo.dart';
import 'package:modu_3_dart_study/repository/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final results = await _photoDataSource.getAll();
      return results
          .map((e) => Photo.fromJson(e))
          .where((photo) => photo.albumId == albumId)
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
