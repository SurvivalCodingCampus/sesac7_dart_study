import 'package:modu_3_dart_study/model/photo2/photo2.dart';

abstract interface class Photo2Repository {
  Future<List<Photo2>> getPhotos();
}
