import 'package:modu_3_dart_study/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/model/photo.dart';
import 'package:modu_3_dart_study/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl({required PhotoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final jsons = await _dataSource.getPhotos();
      return jsons
          .map(Photo.fromJson)
          .where((photo) => photo.albumId == albumId)
          .toList();
    } catch (e) {
      return [];
    }
  }
}
