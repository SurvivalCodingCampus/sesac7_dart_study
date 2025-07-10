import 'package:modu_3_dart_study/250709/homework1/dto/store_result_dto.dart';
import 'package:modu_3_dart_study/250709/homework1/dto/store_dto.dart';

abstract interface class StoreDataSource {
  StoreResultDto getStoreResult();

  List<StoreDto> getStores();
}
