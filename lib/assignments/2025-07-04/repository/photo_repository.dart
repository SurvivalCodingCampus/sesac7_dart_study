import 'package:modu_3_dart_study/assignments/2025-07-04/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotoByKeyword(String keyword);
}
