import 'package:modu_3_dart_study/data_source_study/model/address.dart';
import 'package:modu_3_dart_study/data_source_study/model/company.dart';

class User {
  int _id;
  String _name;
  String _username;
  String _email;
  Address _address;
  String _phone;
  String _website;
  Company _company;

  static const int idBase = 0; // id 기준값(이것보단 커야한다)
  static const int defaultIdValue = 1; // id의 최소값

  // 생성자
  User({
    required int id,
    required String name,
    required String username,
    required String email,
    required Address address,
    required String phone,
    required String website,
    required Company company,
  }) : _id = id > idBase ? id : defaultIdValue,
       _name = name.isEmpty ? 'undefined' : name,
       _username = username.isEmpty ? 'undefined' : username,
       _email = email.isEmpty ? 'undefined' : email,
       _address = address,
       _phone = phone.isEmpty ? 'undefined' : phone,
       _website = website.isEmpty ? 'undefined' : website,
       _company = company;

  // getter
  int get id => _id;

  String get name => _name;

  String get username => _username;

  String get email => _email;

  Address get address => _address;

  String get phone => _phone;

  String get website => _website;

  Company get company => _company;

  // setter
  set id(int id) {
    if (id < defaultIdValue) {
      throw Exception('id는 1 이상의 값으로 설정 가능합니다.');
    }
    _id = id;
  }

  set name(String name) {
    if (name.isEmpty) {
      throw Exception('사용자 이름을 입력해야 합니다.');
    }
    _name = name;
  }

  set username(String username) {
    if (username.isEmpty) {
      throw Exception('닉네임을 입력해야 합니다.');
    }
    _username = username;
  }

  set email(String email) {
    if (email.isEmpty) {
      throw Exception('이메일을 입력해야 합니다.');
    }
    _email = email;
  }

  set address(Address address) => _address = address;

  set phone(String phone) {
    if (phone.isEmpty) {
      throw Exception('전화번호를 입력해야 합니다.');
    }
    _phone = phone;
  }

  set website(String website) {
    if (website.isEmpty) {
      throw Exception('웹사이트 주소를 입력해야 합니다.');
    }
    _website = website;
  }

  set company(Company company) => _company = company;

  /*
  ### 역직렬화(기존) ###
  User.fromJson(Map<String, dynamic> json)
    : _id = json['id'] > idBase ? json['id'] : defaultIdValue,
      _name = json['name'].isEmpty ? 'undefined' : json['name'],
      _username = json['username'].isEmpty ? 'undefined' : json['username'],
      _email = json['email'].isEmpty ? 'undefined' : json['email'],
      _address = Address.fromJson(json['address']),
      _phone = json['phone'].isEmpty ? 'undefined' : json['phone'],
      _website = json['website'].isEmpty ? 'undefined' : json['website'],
      _company = Company.fromJson(json['company']);
  */

  // 역직렬화(factory)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] > idBase ? json['id'] : defaultIdValue,
      name: json['name'].isEmpty ? 'undefined' : json['name'],
      username: json['username'].isEmpty ? 'undefined' : json['username'],
      email: json['email'].isEmpty ? 'undefined' : json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'].isEmpty ? 'undefined' : json['phone'],
      website: json['website'].isEmpty ? 'undefined' : json['website'],
      company: Company.fromJson(json['company']),
    );
  }

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'id': id > idBase ? id : defaultIdValue,
      'name': name.isEmpty ? 'undefined' : name,
      'username': username.isEmpty ? 'undefined' : username,
      'email': email.isEmpty ? 'undefined' : email,
      'address': address.toJson(),
      'phone': phone.isEmpty ? 'undefined' : phone,
      'website': website.isEmpty ? 'undefined' : website,
      'company': company.toJson(),
    };
  }

  @override
  String toString() {
    return 'id: $id\n, name: $name\n, username: $username\n, email: $email\n, address: ${address.toString()}\n, phone: $phone\n, website: $website\n, company: ${company.toString()}\n\n';
  }
}
