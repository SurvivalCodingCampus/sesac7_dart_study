import '../model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
}
