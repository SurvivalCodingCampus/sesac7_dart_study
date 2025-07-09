import 'package:modu_3_dart_study/dto_mapper/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos();
}
