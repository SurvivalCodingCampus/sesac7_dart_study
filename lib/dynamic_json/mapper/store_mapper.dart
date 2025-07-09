import 'package:modu_3_dart_study/dynamic_json/dto/store_result_dto.dart';

import '../model/store.dart';

extension DtoToStore on StoreResultDto {
  Store toStore(int? editCount, List<StoreDto>? editStores) {
    return Store(
      count: editCount ?? -1,
      stores: editStores ?? [],
    );
  }
}
