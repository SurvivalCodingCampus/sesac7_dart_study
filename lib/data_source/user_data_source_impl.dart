import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/model/address.dart';
import 'package:modu_3_dart_study/model/company.dart';
import 'package:modu_3_dart_study/model/geo.dart';
import 'package:modu_3_dart_study/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUserList() async {
    final file = File('asset/user_list.json');
    final jsonString = file.readAsStringSync();

    final list = jsonDecode(jsonString) as List;
    print(list.length);

    List<User> userList = [];

    for (var map in list) {
      try {
        final user = getUser(map);
        userList.add(user);
      } catch (e) {
        print(e);
      }
    }

    return userList;
  }

  User getUser(Map<String, dynamic> map) {
    final mapId = map['id'];
    final mapName = map['name'];
    final mapUserName = map['username'];
    final mapEmail = map['email'];
    final mapPhone = map['phone'];
    final mapWebsite = map['website'];
    final mapAddress = map['address'];
    final mapCompany = map['company'];

    if (mapId == null || mapId is! int) {
      throw Exception('id 에러');
    }
    if (mapName == null || mapName is! String || mapName.isEmpty) {
      throw Exception('name 에러');
    }
    if (mapUserName == null || mapUserName is! String || mapUserName.isEmpty) {
      throw Exception('username 에러');
    }
    if (mapEmail == null || mapEmail is! String || mapEmail.isEmpty) {
      throw Exception('email 에러');
    }
    if (mapPhone == null || mapPhone is! String || mapPhone.isEmpty) {
      throw Exception('phone 에러');
    }
    if (mapWebsite == null || mapWebsite is! String || mapWebsite.isEmpty) {
      throw Exception('website 에러');
    }
    if (mapAddress == null) {
      throw Exception('address 에러');
    }
    if (mapCompany == null) {
      throw Exception('company 에러');
    }

    Address address;
    Company company;

    try {
      address = getAddress(mapAddress);
    } catch (e) {
      rethrow;
    }

    try {
      company = getCompany(mapCompany);
    } catch (e) {
      rethrow;
    }

    return User(
      id: mapId,
      name: mapName,
      username: mapUserName,
      email: mapEmail,
      address: address,
      phone: mapPhone,
      website: mapWebsite,
      company: company,
    );
  }

  Address getAddress(Map<String, dynamic> map) {
    final street = map['street'];
    final suite = map['suite'];
    final city = map['city'];
    final zipcode = map['zipcode'];
    final mapGeo = map['geo'];

    if (street == null || street is! String || street.isEmpty) {
      throw Exception('street 에러');
    }
    if (suite == null || suite is! String || suite.isEmpty) {
      throw Exception('suite 에러');
    }
    if (city == null || city is! String || city.isEmpty) {
      throw Exception('city 에러');
    }
    if (zipcode == null || zipcode is! String || zipcode.isEmpty) {
      throw Exception('zipcode 에러');
    }
    if (mapGeo == null) {
      throw Exception('geo 에러');
    }

    Geo geo;

    try {
      geo = getGeo(mapGeo);
    } catch (e) {
      rethrow;
    }

    return Address(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo,
    );
  }

  Geo getGeo(Map<String, dynamic> map) {
    final mapLat = map['lat'];
    final mapLng = map['lng'];

    if (mapLat == null) {
      throw Exception('lat 에러');
    }
    if (mapLng == null) {
      throw Exception('lng 에러');
    }

    late double lat;
    late double lng;

    try {
      if (mapLat is String) {
        lat = double.parse(mapLat);
      } else if (mapLat is num) {
        lat = mapLat.toDouble();
      }

      if (mapLng is String) {
        lng = double.parse(mapLng);
      } else if (mapLng is num) {
        lng = mapLng.toDouble();
      }
    } catch (e) {
      throw Exception('lat,lng 파싱에러');
    }

    return Geo(lat: lat, lng: lng);
  }

  Company getCompany(Map map) {
    final name = map['name'];
    final catchPhrase = map['catchPhrase'];
    final bs = map['bs'];

    if (name == null || name is! String || name.isEmpty) {
      throw Exception('name 에러');
    }
    if (catchPhrase == null || catchPhrase is! String || catchPhrase.isEmpty) {
      throw Exception('catchPhrase 에러');
    }
    if (bs == null || bs is! String || bs.isEmpty) {
      throw Exception('bs 에러');
    }

    return Company(name: name, catchPhrase: catchPhrase, bs: bs);
  }
}

void main() async {
  final userDataSourceImpl = UserDataSourceImpl();
  final list = await userDataSourceImpl.getUserList();

  print(list.length);
  print(list);
}
