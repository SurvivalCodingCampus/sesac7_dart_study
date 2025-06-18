import 'intangible_asset.dart';

class Patent extends IntangibleAsset {
  String novelty; // 신규성. 특허권의 특징중 하나인 신규성.

  Patent({
    required super.name,
    required super.price,
    required super.scalability,
    required this.novelty,
  });
}
