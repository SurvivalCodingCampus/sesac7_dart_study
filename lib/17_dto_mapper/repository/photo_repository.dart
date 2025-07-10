import 'package:modu_3_dart_study/17_dto_mapper/model/photo.dart';
import 'package:modu_3_dart_study/18_result_pattern/core/network_error_for_photo.dart';

import '../../18_result_pattern/core/result.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, NetworkErrorForPhoto>> getPhotos();

  Future<Result<List<Photo>, Exception>> getPhotos2();
}
