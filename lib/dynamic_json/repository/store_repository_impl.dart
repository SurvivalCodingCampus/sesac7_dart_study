import 'package:modu_3_dart_study/dynamic_json/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/dynamic_json/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/dynamic_json/model/store.dart';
import 'package:modu_3_dart_study/dynamic_json/repository/store_repository.dart';

import '../dto/store_result_dto.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl({required StoreDataSource storeDataSource})
    : _storeDataSource = storeDataSource;

  @override
  Future<Store> getValidStores() async {
    // StoreResultDto 객체
    final StoreResultDto storeDtos = await _storeDataSource.getStores();

    // Store 객체 반환
    return storeDtos.toStore();
  }
}

// void main() async {
//   StoreRepository s = StoreRepositoryImpl(
//     storeDataSource: StoreDataSourceImpl(),
//   );
//
//   final result = await s.getValidStores();
//   print(result.toString());
// }
