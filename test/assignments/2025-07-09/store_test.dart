import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/mock_store_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/store_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/store_repository_impl.dart';

void main() {
  final StoreDataSource source = MockStoreDataSourceImpl();
  final StoreRepository repo = StoreRepositoryImpl(source);

  final stores = repo.getStores();
  print(stores);
}
