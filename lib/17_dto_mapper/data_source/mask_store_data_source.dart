import 'package:modu_3_dart_study/16_http/core/response.dart';
import 'package:modu_3_dart_study/17_dto_mapper/dto/mask_store_dto.dart';

abstract interface class MaskStoreDataSource {
  Future<Response<MaskStoreDto>> getMaskStore();
}
