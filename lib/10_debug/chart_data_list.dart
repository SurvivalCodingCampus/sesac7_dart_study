import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/10_debug/chart_data.dart';

class ChartDataList {
  final List<ChartData> _collectionChartDataList;

  List<ChartData> get collectionChartDataList => _collectionChartDataList;

  ChartDataList({
    required List<ChartData> collectionChartDataList,
  }) : _collectionChartDataList = collectionChartDataList;

  ChartDataList.fromJson(Map<String, dynamic> json)
    : _collectionChartDataList =
          (json['collectionChartDataList'] as List) // List<dynamic>
              .map(
                (e) => ChartData.fromJson(e as Map<String, dynamic>),
              ) // Iterable<ChartData>
              .toList(); // List<ChartData>

  @override
  bool operator ==(Object other) {
    return other is ChartDataList
        ? DeepCollectionEquality().equals(
            collectionChartDataList,
            other.collectionChartDataList,
          )
        : false;
  }

  @override
  int get hashCode => Object.hashAll(collectionChartDataList);

  @override
  String toString() =>
      'ChartDataList(collectionChartDataList: $collectionChartDataList)';

  Map<String, dynamic> toJson() => {
    'collectionChartDataList': collectionChartDataList
        .map((e) => e.toJson())
        .toList(),
  };
}
