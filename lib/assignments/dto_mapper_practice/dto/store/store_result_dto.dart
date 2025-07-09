import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/dto/store/store_dto.dart';

part 'store_result_dto.freezed.dart';
part 'store_result_dto.g.dart';

@freezed
abstract class StoreResultDto with _$StoreResultDto {
  const factory StoreResultDto({int? count, List<StoreDto>? stores}) =
      _StoreResultDto;

  factory StoreResultDto.fromJson(Map<String, Object?> json) =>
      _$StoreResultDtoFromJson(json);
}
