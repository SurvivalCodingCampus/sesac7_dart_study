import 'dart:convert';
import 'dart:io';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}

// 구현체
class UserImpl implements UserDataSource{

  @override
  Future<List<User>> getUsers() async{
    final file = await File('lib/assets/users.json').readAsString();
    List<dynamic> rawList = jsonDecode(file);
    List<User> userList = rawList.map((item) => User.fromJson(item)).toList();

    return userList;
  }
  
}

class User {
  num id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({required this.id, required this.name, required this.username, required this.email, required this.address, required this.phone, required this.website, required this.company});

  factory User.fromJson(Map<String, dynamic> userMap){
    return User(id: (userMap['id'] ?? 0), 
    name: (userMap['name'] ?? ''), 
    username: (userMap['username'] ?? ''), 
    email: (userMap['email'] ?? ''), 
    address: Address.fromJson(userMap['address'] ?? {}),
    phone: (userMap['phone'] ?? ''), 
    website: (userMap['website'] ?? ''), 
    company: Company.fromJson(userMap['company'] ?? {}));
  }

  Map<String, dynamic> toJson(){
    return {'id': id, 'name': name, 'username' : username, 'email' : email, 'address' : address.toJson(), 'phone' : phone, 'website' : website, 'company' : company.toJson()};
  }

  @override
  bool operator ==(Object other) => 
    identical(this, other) ||
    other is User &&
      id == other.id &&
      name == other.name &&
      username == other.username &&
      email == other.email &&
      address == other.address &&
      phone == other.phone &&
      website == other.website &&
      company == other.company;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ username.hashCode ^ email.hashCode ^ address.hashCode ^ phone.hashCode ^ website.hashCode ^ company.hashCode;

  @override
  String toString() => 'id: $id, name: $name, username: $username, phone: $phone, website: $website, company: $company';
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({required this.street, required this.suite, required this.city, required this.zipcode, required this.geo});

  factory Address.fromJson(Map<String, dynamic> userMap){
    return Address(street: userMap['street'] ?? '',
    suite: userMap['suite'] ?? '',
    city: userMap['city'] ?? '', 
    zipcode: userMap['zipcode'] ?? '', 
    geo: Geo.fromJson(userMap['geo'] ?? {}));
  }

  Map<String, dynamic> toJson(){
    return {'street' : street, 'suite': suite, 'city' : city, 'zipcode' : zipcode, 'geo' : geo.toJson() };
  }

  @override
  bool operator ==(Object other) => 
    identical(this, other) ||
    other is Address &&
      street == other.street &&
      suite == other.suite &&
      city == other.city &&
      zipcode == other.zipcode &&
      geo == other.geo;

  @override
  int get hashCode => street.hashCode ^ suite.hashCode ^ city.hashCode ^ zipcode.hashCode ^ geo.hashCode;

}

class Geo {
  String lat;
  String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> userMap){
    return Geo(lat: userMap['lat'] ?? '',
    lng: userMap['lng'] ?? '');
  }

  Map<String, dynamic> toJson(){
    return {'lat' : lat, 'lng': lng};
  }

  @override
  bool operator ==(Object other) => 
    identical(this, other) ||
    other is Geo &&
      lat == other.lat &&
      lng == other.lng;

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> userMap){
    return Company(name: userMap['name'] ?? '',
    catchPhrase: userMap['catchPhrase'] ?? '',
    bs: userMap['bs'] ?? '');
  }

  Map<String, dynamic> toJson(){
    return {'name' : name, 'catchPhrase': catchPhrase, 'bs': bs};
  }

  @override
  bool operator ==(Object other) => 
    identical(this, other) ||
    other is Company &&
      name == other.name &&
      catchPhrase == other.catchPhrase &&
      bs == other.bs;

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
}