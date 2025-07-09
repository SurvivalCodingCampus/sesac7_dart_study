import 'package:modu_3_dart_study/17_dto_mapper/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}
