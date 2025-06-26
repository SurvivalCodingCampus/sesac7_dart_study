

import 'dart:convert';
import 'dart:io';

class CollectionSalePrice {
  final double _price;
  final String _cvtDatetime;

  double get price => _price;
  String get cvtDatetime => _cvtDatetime;

  CollectionSalePrice(double price, String cvtDatetime): _price = price, _cvtDatetime = cvtDatetime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CollectionSalePrice &&
              runtimeType == other.runtimeType &&
              _price == other._price &&
              _cvtDatetime == other._cvtDatetime;

  @override
  int get hashCode => _price.hashCode ^ _cvtDatetime.hashCode;

  CollectionSalePrice copyWith({
    double? price,
    String? cvtDatetime,
  }) {
    return CollectionSalePrice(
      price ?? _price,
      cvtDatetime ?? _cvtDatetime,
    );
  }

  CollectionSalePrice.fromJson(Map<String, dynamic> json) :
      _price = json['price'],
      _cvtDatetime = json['cvtDatetime'];

  Map<String, dynamic> toJson() {
    return {
      'price' : _price,
      'cvtDatetime' : _cvtDatetime
    };
  }
}

class CollectionChartData {
  final List<CollectionSalePrice>? _collectionSalePrice;
  final String _collectionName;

  CollectionChartData(List<CollectionSalePrice>? collectionSalePrice, String collectionName)
    :_collectionSalePrice = collectionSalePrice, _collectionName = collectionName;

  String get collectionName => _collectionName;
  List<CollectionSalePrice>? get collectionSalePrice => _collectionSalePrice;



  CollectionChartData.fromJson(Map<String, dynamic> json) :
        _collectionName = json['collectionName'],
        _collectionSalePrice = json['collectionSalePrice'] != null ?
        (json['collectionSalePrice'] as List<dynamic>).map((e) => CollectionSalePrice.fromJson(e)).toList() : null;

  Map<String, dynamic> toJson() {
    return {
      'collectionSalePrice' : _collectionSalePrice?.map((e) => e.toJson()).toList(),
      'collectionName' : _collectionName
    };
  }

  CollectionChartData copyWith({
    List<CollectionSalePrice>? collectionSalePrice,
    String? collectionName,
  }) {
    return CollectionChartData(
      collectionSalePrice ?? this._collectionSalePrice,
      collectionName ?? this._collectionName,
    );
  }
}