class User {
  final num id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id'] as num?) ?? 0,
      name: (json['name'] as String?) ?? '',
      username: (json['username'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: (json['phone'] as String?) ?? '',
      website: (json['website'] as String?) ?? '',
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
    );
  }
}

class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: (json['lat'] as String?) ?? '0.0',
      lng: (json['lng'] as String?) ?? '0.0',
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: (json['street'] as String?) ?? '',
      suite: (json['suite'] as String?) ?? '',
      city: (json['city'] as String?) ?? '',
      zipcode: (json['zipcode'] as String?) ?? '',
      geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: (json['name'] as String?) ?? '',
      catchPhrase: (json['catchPhrase'] as String?) ?? '',
      bs: (json['bs'] as String?) ?? '',
    );
  }
}
