import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/12_debugging/collection_chart_data.dart';

class ChartData {
  final List<CollectionChartData?>? collectionChartDataList;

  ChartData(this.collectionChartDataList);

  ChartData.fromJson(Map<String, dynamic> json)
    : collectionChartDataList =
          ((json['collectionChartDataList'] ?? []) as List)
              .map((data) => CollectionChartData.fromJson(data))
              .toList();

  Map<String, dynamic> toJson() => {
    'collectionChartDataList': (collectionChartDataList ?? [])
        .map((data) => (data ?? CollectionChartData('', [])).toJson())
        .toList(),
  };

  @override
  bool operator ==(Object other) {
    if (other is ChartData) {
      return ListEquality().equals(
        collectionChartDataList,
        other.collectionChartDataList,
      );
    }
    return false;
  }

  @override
  int get hashCode => ListEquality().hash(collectionChartDataList);

  @override
  String toString() {
    return '{"collectionChartDataList": $collectionChartDataList}';
  }
}
