import 'package:modu_3_dart_study/250709/homework2/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos();
}
