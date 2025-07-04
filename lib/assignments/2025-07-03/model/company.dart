// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.catchPhrase == catchPhrase &&
        other.bs == bs;
  }

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;

  @override
  String toString() =>
      'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  Company copyWith({String? name, String? catchPhrase, String? bs}) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }
}
