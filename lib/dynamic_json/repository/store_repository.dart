import 'package:modu_3_dart_study/dynamic_json/model/store.dart';

abstract interface class StoreRepository {
  Future<Store> getValidStores();
}
