class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  @override
  String toString() =>
      'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  @override
  int get hashCode => Object.hash(name, catchPhrase, bs);

  @override
  bool operator ==(Object other) => other is Company
      ? name == other.name && catchPhrase == other.catchPhrase && bs == other.bs
      : false;

  Company copyWith({String? name, String? catchPhrase, String? bs}) => Company(
    name: name ?? this.name,
    catchPhrase: catchPhrase ?? this.catchPhrase,
    bs: bs ?? this.bs,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'catchPhrase': catchPhrase,
    'bs': bs,
  };
}
