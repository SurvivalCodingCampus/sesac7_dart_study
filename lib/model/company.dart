import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @override
  String toString() =>
      'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  @override
  int get hashCode => Object.hash(name, catchPhrase, bs);

  @override
  bool operator ==(Object other) => other is Company
      ? name == other.name && catchPhrase == other.catchPhrase && bs == other.bs
      : false;

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  Company copyWith({String? name, String? catchPhrase, String? bs}) => Company(
    name: name ?? this.name,
    catchPhrase: catchPhrase ?? this.catchPhrase,
    bs: bs ?? this.bs,
  );
}
