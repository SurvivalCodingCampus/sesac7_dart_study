import 'package:modu_3_dart_study/core/network_validator_impl.dart';
import 'package:modu_3_dart_study/data_source/store/store_data_source.dart';
import 'package:modu_3_dart_study/dto/store/store_dto.dart';
import 'package:modu_3_dart_study/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/repository/store/store_repository.dart';
import 'package:modu_3_dart_study/repository/store/store_repository_impl.dart';
import 'package:test/test.dart';

import '../../mocks/mock_store_data_source_impl.dart';

void main() {
  final StoreDataSource dataSource = MockStoreDataSourceImpl();
  final StoreRepository repository = StoreRepositoryImpl(
    dataSource: dataSource,
    validator: NetworkValidatorImpl(),
  );

  group('getStores', () {
    test(
      'The Store list has two values for remainStatus, stockAt, and createdAt, except for null or empty strings.',
      () async {
        // given
        final expectedLength = 2;

        // when
        final stores = await repository.getStores();

        // then
        expect(stores.length, expectedLength);
      },
    );

    test(
      'If the data is normal, it returns a normal model.',
      () async {
        // given
        final json = {
          "addr": "서울특별시 강북구 솔매로 38 (미아동)",
          "code": "11817488",
          "created_at": "2020/07/03 11:00:00",
          "lat": 37.6254369,
          "lng": 127.0164096,
          "name": "승약국",
          "remain_stat": "plenty",
          "stock_at": "2020/07/02 18:05:00",
          "type": "01",
        };
        final expectedStore = StoreDto.fromJson(json).toModel();

        // when
        final stores = await repository.getStores();

        // then
        expect(stores.first, expectedStore);
      },
    );

    test(
      'Returns an empty list if the statusCode is not in the 200s.',
      () async {
        // given
        final expectedResult = [];
        final StoreDataSource dataSource = MockStoreDataSourceImpl(
          statusCode: 404,
        );
        final StoreRepository repository = StoreRepositoryImpl(
          dataSource: dataSource,
          validator: NetworkValidatorImpl(),
        );

        // when
        final stores = await repository.getStores();

        // then
        expect(stores, expectedResult);
      },
    );

    test(
      'Returns an empty list if the DataSource throws an exception.',
      () async {
        // given
        final expectedResult = [];
        final StoreDataSource dataSource = MockStoreDataSourceImpl(
          isException: true,
        );
        final StoreRepository repository = StoreRepositoryImpl(
          dataSource: dataSource,
          validator: NetworkValidatorImpl(),
        );

        // when
        final stores = await repository.getStores();

        // then
        expect(stores, expectedResult);
      },
    );
  });
}
