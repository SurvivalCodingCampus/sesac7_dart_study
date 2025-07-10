import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/dto/store/store_list_dto.dart';

abstract interface class StoreDataSource {
  Future<Response<StoreListDto>> getStores();
}
