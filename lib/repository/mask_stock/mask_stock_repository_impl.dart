import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/mask_stock/mask_stock_data_source.dart';
import 'package:modu_3_dart_study/dto/mask_stock_dto.dart';
import 'package:modu_3_dart_study/mapper/mask_stock_mapper.dart';
import 'package:modu_3_dart_study/model/mask_stock.dart';
import 'package:modu_3_dart_study/model/store.dart';
import 'package:modu_3_dart_study/repository/mask_stock/mask_stock_repository.dart';

class MaskStockRepositoryImpl implements MaskStockRepository {
  final MaskStockDataSource _dataSource;

  MaskStockRepositoryImpl({required MaskStockDataSource dataStore})
    : _dataSource = dataStore;

  @override
  Future<List<Store>> getMaskStockStores() async {
    final Response<MaskStockDto> maskStockResponse = await _dataSource
        .getMaskStockStores();
    if (maskStockResponse.statusCode != 200) {
      throw Exception('http status code: ${maskStockResponse.statusCode}');
    } else {
      final MaskStock maskStockModel = maskStockResponse.body.toModel();

      if (maskStockModel.count <= 0) {
        throw Exception('MaskStockModel count가 없습니다.');
      } else {
        return maskStockModel.stores
            .where(
              (store) =>
                  store.remainStat.isNotEmpty &&
                  store.stockAt.isNotEmpty &&
                  store.createdAt.isNotEmpty,
            )
            .toList();
      }
    }
  }
}
