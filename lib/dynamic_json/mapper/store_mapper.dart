import 'package:modu_3_dart_study/dynamic_json/dto/store_result_dto.dart';

import '../model/store.dart';

extension DtoToStore on StoreResultDto {
  Store toStore() {
    // stores 중 조건에 맞는 데이터만 추려서 저장
    final List<StoreDto>? storeDtosResult = stores
        ?.where((e) => e.remainStat != null && e.remainStat != '')
        .where((e) => e.stockAt != null && e.stockAt != '')
        .where((e) => e.createdAt != null && e.createdAt != '')
        .toList();

    return Store(
      count: storeDtosResult?.length ?? -1, // 잘못된 값 들어올 시 -1(오류값) 저장
      stores: storeDtosResult ?? [], // 잘못된 값 들어올 시 빈 리스트(오류값) 저장
    );
  }
}
