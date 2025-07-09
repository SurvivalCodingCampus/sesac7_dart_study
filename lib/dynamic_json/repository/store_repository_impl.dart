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

    // stores 중 조건에 맞는 데이터만 추려서 저장
    final List<StoreDto>? storeDtosResult = storeDtos.stores
        ?.where((e) => e.remainStat != null && e.remainStat != '')
        .where((e) => e.stockAt != null && e.stockAt != '')
        .where((e) => e.createdAt != null && e.createdAt != '')
        .toList();

    // Store 객체 반환
    // 이때 count는 storeDtosResult의 length 값을 받고,
    // stores(약국 리스트)는 storeDtosResult를 받는다.
    return storeDtos.toStore(storeDtosResult?.length, storeDtosResult);
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
