class CompanyInfo {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  CompanyInfo(this.name, this.catchPhrase, this.bs);

  @override
  String toString() {
    return 'CompanyInfo{name : $name, catchPhrase : $catchPhrase, bs : $bs}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyInfo &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          catchPhrase == other.catchPhrase &&
          bs == other.bs;

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;

  Map<String, dynamic> toJson() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      json['name'] as String,
      json['catchPhrase'] as String,
      json['bs'] as String,
    );
  }

  CompanyInfo copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return CompanyInfo(
      name ?? this.name,
      catchPhrase ?? this.catchPhrase,
      bs ?? this.bs,
    );
  }
}
