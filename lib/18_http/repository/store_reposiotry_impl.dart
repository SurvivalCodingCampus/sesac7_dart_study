import 'package:http/http.dart';
import 'package:modu_3_dart_study/18_http/core/response_core.dart';
import 'package:modu_3_dart_study/18_http/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/18_http/dto/store_dto.dart';

class StoreRepositoryImpl implements StoreDataSource {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl(this._storeDataSource);

  @override
  Future<ResponseCore<List<StoreDto>>> getStoreList() async {
    final ResponseCore<List<StoreDto>> response = await _storeDataSource.getStoreList();
    if (response.statusCode != 200) {
      throw Exception('실패');
    }
    throw Exception('실패');

  }
}
