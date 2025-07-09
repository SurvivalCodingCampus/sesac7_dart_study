import 'package:modu_3_dart_study/assignments/dto_mapper_practice/dto/store/store_result_dto.dart';
import 'package:modu_3_dart_study/assignments/http_practice/core/response.dart';

abstract interface class StoreDataSource {
  Future<Response<StoreResultDto>> getStoreResult();
}
