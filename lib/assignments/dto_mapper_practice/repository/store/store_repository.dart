import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/store/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
}
