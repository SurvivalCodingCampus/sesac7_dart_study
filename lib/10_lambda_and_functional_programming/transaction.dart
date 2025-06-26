import 'package:modu_3_dart_study/10_lambda_and_functional_programming/trader.dart';

class Transaction {
  final Trader _trader;
  final int _year;
  final int _value;

  Trader get trader => _trader;

  int get year => _year;

  int get value => _value;

  Transaction({
    required Trader trader,
    required int year,
    required int value,
  }) : _trader = trader,
       _year = year,
       _value = value;

  Transaction.fromJson(Map<String, dynamic> json)
    : _trader = Trader.fromJson(json['trader']),
      _year = json['year'],
      _value = json['value'];

  @override
  String toString() =>
      'Transaction(trader: $trader, year: $year, value: $value)';

  @override
  int get hashCode => trader.hashCode ^ year.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Transaction
        ? other.trader == trader && other.year == year && other.value == value
        : false;
  }

  Map<String, dynamic> toJson() => {
    'trader': trader.toJson(),
    'year': year,
    'value': value,
  };
}
