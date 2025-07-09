import 'package:modu_3_dart_study/core/response.dart';

import '../../dto/mask_stock_dto.dart';

abstract interface class MaskStockDataSource {
  Future<Response<MaskStockDto>> getMaskStockStores();
}