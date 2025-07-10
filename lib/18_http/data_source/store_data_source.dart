import 'package:modu_3_dart_study/18_http/core/response_core.dart';
import 'package:modu_3_dart_study/18_http/dto/store_dto.dart';

abstract interface class StoreDataSource{
  Future<ResponseCore<List<StoreDto>>> getStoreList();
}