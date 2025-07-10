import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/dto/photo2/photo2_dto.dart';

abstract interface class Photo2DataSource {
  Future<Response<List<Photo2Dto>>> getPhotos();
}
