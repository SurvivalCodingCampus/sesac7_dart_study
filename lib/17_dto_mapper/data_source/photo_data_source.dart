import 'package:modu_3_dart_study/16_http/core/response.dart';
import 'package:modu_3_dart_study/17_dto_mapper/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<Response<List<PhotoDto?>>> getPhotoDtos();
}
