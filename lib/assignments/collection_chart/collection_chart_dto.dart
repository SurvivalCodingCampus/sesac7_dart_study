import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/collection_chart/collection_chart_data.dart';

class CollectionChartDTO {
  static const String collectionChartDataListString = 'collectionChartDataList';

  final List<CollectionChartData>? collectionChartDataList;

  CollectionChartDTO({required this.collectionChartDataList});

  CollectionChartDTO.fromJson(Map<String, dynamic> json)
    : collectionChartDataList = json[collectionChartDataListString] == null
          ? null
          : (json[collectionChartDataListString] as List)
                .map((e) => e as Map<String, dynamic>)
                .map((e) => CollectionChartData.fromJson(e))
                .toList();

  Map<String, dynamic> toJson() {
    return {
      collectionChartDataListString: collectionChartDataList
          ?.map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => collectionChartDataList?.hashCode ?? 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionChartDTO &&
          ListEquality().equals(
            collectionChartDataList,
            other.collectionChartDataList,
          );

  @override
  String toString() {
    return 'CollectionChartDTO{$collectionChartDataListString: $collectionChartDataList}\n';
  }
}
