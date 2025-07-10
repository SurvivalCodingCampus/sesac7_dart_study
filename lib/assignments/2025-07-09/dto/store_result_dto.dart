import 'package:modu_3_dart_study/assignments/2025-07-09/dto/store_dto.dart';

class StoreResultDTO {
  final int? count;
  final List<StoreDTO>? stores;
  const StoreResultDTO({this.count, this.stores});
  StoreResultDTO copyWith({int? count, List<StoreDTO>? stores}) {
    return StoreResultDTO(
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

  static StoreResultDTO fromJson(Map<String, Object?> json) {
    return StoreResultDTO(
      count: json['count'] == null ? null : json['count'] as int,
      stores: json['stores'] == null
          ? null
          : (json['stores'] as List)
                .map<StoreDTO>(
                  (data) => StoreDTO.fromJson(data as Map<String, Object?>),
                )
                .toList(),
    );
  }

  @override
  String toString() {
    return 'StoreResultDTO(count: $count, stores: $stores)';
  }

  @override
  bool operator ==(Object other) {
    return other is StoreResultDTO &&
        other.runtimeType == runtimeType &&
        other.count == count &&
        other.stores == stores;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, count, stores);
  }
}
