import 'package:modu_3_dart_study/17_dto_mapper/model/photo.dart';
import 'package:modu_3_dart_study/18_result_pattern/core/network_error.dart';

import '../../18_result_pattern/core/result.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, NetworkError>> getPhotos();

  Future<Result<List<Photo>, Exception>> getPhotos2();
}
