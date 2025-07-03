import 'package:json_annotation/json_annotation.dart';

part 'sword.g.dart';

@JsonSerializable(explicitToJson: true)
class Sword {
  final int power;

  Sword(this.power);

  factory Sword.fromJson(Map<String, dynamic> json) => _$SwordFromJson(json);

  Map<String, dynamic> toJson() => _$SwordToJson(this);
}


