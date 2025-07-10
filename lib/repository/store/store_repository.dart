import 'package:modu_3_dart_study/model/store/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
}
