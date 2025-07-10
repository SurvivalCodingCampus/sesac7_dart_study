import 'package:modu_3_dart_study/20250709/data_source/mask_store_data_source.dart';
import 'package:modu_3_dart_study/20250709/repository/mask_store_repository.dart';
import 'package:modu_3_dart_study/20250709/repository/mask_store_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'mock_mask_store_data_source_impl.dart';

void main() {
  test('마스크 스토어 Mock 데이터 테스트', () async {

  final MaskStoreDataSource mockDataSource = MockMaskStoreDataSourceImpl();
  final MaskStoreRepository repository = MaskStoreRepositoryImpl(mockDataSource);

  final storeList = await repository.getStores();
    expect(storeList.length, 216);
  });
}