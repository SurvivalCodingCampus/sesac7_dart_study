import 'package:modu_3_dart_study/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/model/mask_stock.dart';

import '../dto/mask_stock_dto.dart';

extension MaskStockDtoToModel on MaskStockDto {
  MaskStock toModel() {
    return MaskStock(
      count: count ?? -1,
      stores: stores?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }
}

extension MaskStockModelToDto on MaskStock {
  MaskStockDto toDto() {
    return MaskStockDto(
      count: count,
      stores: stores.map((model) => model.toDto()).toList(),
    );
  }
}
