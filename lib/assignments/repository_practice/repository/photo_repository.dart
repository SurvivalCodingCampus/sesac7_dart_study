import 'package:modu_3_dart_study/assignments/repository_practice/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}
