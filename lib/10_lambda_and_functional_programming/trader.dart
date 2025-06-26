class Trader {
  final String _name;
  final String _city;

  String get name => _name;

  String get city => _city;

  Trader({
    required String name,
    required String city,
  }) : _name = name,
       _city = city;

  Trader.fromJson(Map<String, dynamic> json)
    : _name = json['name'],
      _city = json['city'];

  @override
  String toString() => 'Trader(name: $name, city: $city)';

  @override
  int get hashCode => name.hashCode ^ city.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Trader ? other.name == name && other.city == city : false;
  }

  Map<String, dynamic> toJson() => {'name': name, 'city': city};
}
