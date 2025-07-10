import 'package:modu_3_dart_study/core/response.dart';
import '../../dto/store_dto.dart';

abstract interface class RemoteStoreDataSource {
  Future<Response<List<StoreDto>>> getStores();
  Future<Response<StoreDto>> getStore(int code);

  Future<Response<StoreDto>> createStore(StoreDto store);
  Future<Response<StoreDto>> updateStore(int code, StoreDto store);

  Future<Response<StoreDto>> patchStore(int code, StoreDto store);

  Future<Response<StoreDto?>> deleteStore(int code);
}
