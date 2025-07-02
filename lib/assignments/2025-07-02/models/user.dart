class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

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

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      username = json['username'],
      email = json['email'],
      address = Address.fromJson(json['address']),
      phone = json['phone'],
      website = json['website'],
      company = Company.fromJson(json['company']);
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  Address.fromJson(Map<String, dynamic> json)
    : street = json['street'] ?? '',
      suite = json['suite'] ?? '',
      city = json['city'] ?? '',
      zipcode = json['zipcode'] ?? '',
      geo = Geo.fromJson(json['geo'] as Map<String, dynamic>);
}

class Geo {
  String lat;
  String lng;

  Geo({required this.lat, required this.lng});

  Geo.fromJson(Map<String, dynamic> json)
    : lat = json['lat'] ?? '',
      lng = json['lng'] ?? '';
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Company.fromJson(Map<String, dynamic> json)
    : name = json['name'] ?? '',
      catchPhrase = json['catchPhrase'] ?? '',
      bs = json['bs'] ?? '';
}
