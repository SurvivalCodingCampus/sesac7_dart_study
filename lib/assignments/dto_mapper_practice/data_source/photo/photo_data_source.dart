import 'package:modu_3_dart_study/assignments/dto_mapper_practice/dto/photo/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/http_practice/core/response.dart';

abstract interface class PhotoDataSource {
  Future<Response<List<PhotoDto>>> getPhotos();
}
