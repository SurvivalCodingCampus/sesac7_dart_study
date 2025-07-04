import 'package:modu_3_dart_study/repository/photo_repository.dart';
import 'package:modu_3_dart_study/data_source/local/data_source.dart';
import 'package:modu_3_dart_study/model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository{

  final DataSource _photoDataSource; 
  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {

    try { 
      final result = await _photoDataSource.getAll();
      return result
        .map((e) => Photo.fromJson(e))
        .where((photo) => photo.albumId == albumId)
        .toList();
    } catch (e) {
      return [];
    }

  }
}