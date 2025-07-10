import 'package:modu_3_dart_study/data_source/remote/remote_store_data_source.dart';
import 'package:modu_3_dart_study/dto/store_dto.dart';
import 'package:modu_3_dart_study/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/model/store.dart';
import 'package:modu_3_dart_study/repository/store_repository.dart';

import '../core/response.dart';

class StoreRepositoryImpl implements StoreRepository {
  final RemoteStoreDataSource _dataSource;

  StoreRepositoryImpl(this._dataSource);

  @override
  Future<List<Store>> getStoreVaild() async {
    final Response<List<StoreDto>> response = await _dataSource.getStores();
    if (response.statusCode != 200) {
      throw Exception('실패: ${response.statusCode}');
    }

    return response.body
        .map((StoreDto dto) => dto.toModel())
        .where(
          (store) =>
              store.remainStat != null &&
              store.remainStat!.isNotEmpty &&
              store.stockAt != null &&
              store.stockAt!.isNotEmpty &&
              store.createdAt != null &&
              store.createdAt!.isNotEmpty,
        )
        .toList();
  }
}
