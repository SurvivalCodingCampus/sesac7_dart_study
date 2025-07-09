import 'package:modu_3_dart_study/dynamic_json/dto/store_result_dto.dart';

abstract interface class StoreDataSource {
  Future<StoreResultDto> getStores();
}
