import 'package:modu_3_dart_study/assignments/2025-06-13/intangible_asset.dart';

class Patent extends IntangibleAsset {
  String novelty; // 신규성. 특허권의 특징중 하나인 신규성.

  Patent(super.name, super.price, super.scalability, this.novelty);
}
