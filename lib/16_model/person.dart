import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/16_model/sword.dart';

part 'person.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  @JsonKey(name: 'full_name')
  final String name;
  final int age;
  final String hobby;
  final Sword sword;

  const Person({
    required this.name,
    required this.age,
    required this.hobby,
    required this.sword,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}