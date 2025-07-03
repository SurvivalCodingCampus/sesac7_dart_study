class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: (json['name'] is String) ? json['name'] as String : null,
      catchPhrase: (json['catchPhrase'] is String)
          ? json['catchPhrase'] as String
          : null,
      bs: (json['bs'] is String) ? json['bs'] as String : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }

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
  int get hashCode =>
      (name?.hashCode ?? 0) ^
      (catchPhrase?.hashCode ?? 0) ^
      (bs?.hashCode ?? 0);

  @override
  String toString() {
    return '{"name": $name, "catchPhrase": $catchPhrase, "bs": $bs}';
  }
}
