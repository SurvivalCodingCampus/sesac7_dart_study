import 'package:modu_3_dart_study/dto_mapper/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotoModel();
}
