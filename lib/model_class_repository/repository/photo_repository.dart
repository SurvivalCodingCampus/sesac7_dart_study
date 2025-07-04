import 'package:modu_3_dart_study/model_class_repository/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}
