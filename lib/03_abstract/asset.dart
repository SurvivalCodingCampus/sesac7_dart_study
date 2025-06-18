import 'package:modu_3_dart_study/03_abstract/book.dart';
import 'package:modu_3_dart_study/03_abstract/computer.dart';
import 'package:modu_3_dart_study/03_abstract/tangible_asset.dart';
import 'package:modu_3_dart_study/03_abstract/thing.dart';

import '../hero.dart';

abstract class Asset {
  String name;
  int price;

  Asset({
    required this.name,
    required this.price,
  });
}

void main() {
  TangibleAsset computer = Computer(
    name: 'name',
    price: 1,
    color: 'color',
    weight: 1,
    makerName: 'makerName',
  );

  List<Thing> assets = [
    computer,
    Book(
      name: 'name',
      price: 100,
      color: 'color',
      weight: 11,
      isbn: 'isbn',
    ),
  ];

  for (final asset in assets) {
    // Thing
    asset.weight;

    // 날 믿어라 == 휴먼 == 버그
    // final book = asset as Hero;

    if (asset is Book) {
      // 스마트 타입 캐스팅 Book
      print(asset.isbn);
    } else if (asset is Computer) {
      asset.makerName;
    }
    print(asset.runtimeType);
  }
}
