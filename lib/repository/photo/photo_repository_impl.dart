import 'package:modu_3_dart_study/data_source/photo/photo_data_source.dart';
import 'package:modu_3_dart_study/model/photo.dart';
import 'package:modu_3_dart_study/repository/photo/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl({required PhotoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final List<Map<String, dynamic>> photoJsonList = await _dataSource
        .getJsonList();
    return photoJsonList
        .map((photo) => Photo.fromJson(photo))
        .where((photo) => photo.albumId == albumId)
        .toList();
  }
}
