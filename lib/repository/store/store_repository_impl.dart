import 'package:modu_3_dart_study/core/network_validator.dart';
import 'package:modu_3_dart_study/data_source/store/store_data_source.dart';
import 'package:modu_3_dart_study/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/model/store/store.dart';
import 'package:modu_3_dart_study/model/store/store_remain_status.dart';
import 'package:modu_3_dart_study/repository/store/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;
  final NetworkValidator _validator;

  StoreRepositoryImpl({
    required StoreDataSource dataSource,
    NetworkValidator? validator,
  }) : _dataSource = dataSource,
       _validator = validator ?? NetworkValidator();

  @override
  Future<List<Store>> getStores() async {
    try {
      final response = await _dataSource.getStores();

      if (!_validator.validateStatusCode(response.statusCode) ||
          response.body.stores == null) {
        return [];
      }

      return response.body.stores!
          .map((dto) => dto.toModel())
          .where(
            (e) =>
                e.remainStatus != StoreRemainStatus.unknown &&
                e.stockAt != Store.unknownDate &&
                e.createdAt != Store.unknownDate,
          )
          .toList();
    } catch (e) {
      return [];
    }
  }
}
