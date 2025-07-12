import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';

part 'company.g.dart';

@freezed
abstract class Company with _$Company {
  const factory Company({
    required String name,
    required String catchPhrase,
    required String bs,
  }) = _Company;

  factory Company.fromJson(Map<String, Object?> json) => _$CompanyFromJson(json);
}
