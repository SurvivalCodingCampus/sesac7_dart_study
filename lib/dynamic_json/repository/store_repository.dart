import 'package:modu_3_dart_study/dynamic_json/model/store_result.dart';

abstract interface class StoreRepository {
  Future<StoreResult> getValidStores();
}
