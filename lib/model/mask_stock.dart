import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/model/store.dart';

part 'mask_stock.freezed.dart';

@freezed
class MaskStock with _$MaskStock {
  @override
  final num count;
  @override
  final List<Store> stores;

  const MaskStock({
    required this.count,
    required this.stores,
  });
}
