import 'package:freezed_annotation/freezed_annotation.dart';

import '../dto/mask_store_dto.dart';

part 'mask_store.freezed.dart';

part 'mask_store.g.dart';

@freezed
abstract class MaskStore with _$MaskStore {
  const factory MaskStore({
    required num count,
    required List<StoreDTO> stores,
  }) = _MaskStore;

  factory MaskStore.fromJson(Map<String, Object?> json) =>
      _$MaskStoreFromJson(json);

}
