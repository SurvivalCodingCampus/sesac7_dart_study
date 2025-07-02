import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/chart_data.dart';

void main () {

  final chartList = readJsonFile();

  test('chart_data.json 파일을 Chart 클래스 객체로 출력할수있다', (){
    expect(chartList[0].collectionName, equals('collection1'));
  });

  test('Chart 객체 필드에 JSON 데이터가 올바르게 매핑되었다', (){
    expect(chartList[0].collectionSalePrice[0].cvtDatetime, equals('2023-03-26T08:00:00'));
  });

  test('Chart 객체 필드에 JSON 데이터가 올바르게 매핑되었다', (){
    expect(chartList[0].collectionSalePrice[0].price, equals(58.25));
  });
}