import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_dto.dart';

class StoreResultDto {
  final int? count;
  final List<Store_DTO>? stores;
  const StoreResultDto({this.count, this.stores});
  StoreResultDto copyWith({int? count, List<Store_DTO>? stores}) {
    return StoreResultDto(
      count: count ?? this.count,
      stores: stores ?? this.stores,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'count': count,
      'stores': stores
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
    };
  }

  static StoreResultDto fromJson(Map<String, Object?> json) {
    return StoreResultDto(
      count: json['count'] == null ? null : json['count'] as int,
      stores: json['stores'] == null
          ? null
          : (json['stores'] as List)
                .map<Store_DTO>(
                  (data) => Store_DTO.fromJson(data as Map<String, Object?>),
                )
                .toList(),
    );
  }

  @override
  String toString() {
    return '''StoreResultDto(
                count:$count,
stores:${stores.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is StoreResultDto &&
        other.runtimeType == runtimeType &&
        other.count == count &&
        other.stores == stores;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, count, stores);
  }
}
