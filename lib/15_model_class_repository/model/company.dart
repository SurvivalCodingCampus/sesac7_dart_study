import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is Company) {
      return name == other.name &&
          catchPhrase == other.catchPhrase &&
          bs == other.bs;
    }
    return false;
  }

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;

  @override
  String toString() {
    return '{"name": $name, "catchPhrase": $catchPhrase, "bs": $bs}';
  }
}
