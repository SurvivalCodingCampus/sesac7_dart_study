import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/photo/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}
