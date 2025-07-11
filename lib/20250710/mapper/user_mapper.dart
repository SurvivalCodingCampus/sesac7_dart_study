
import 'package:modu_3_dart_study/20250710/dto/user_dto.dart';
import 'package:modu_3_dart_study/20250710/model/address.dart';
import 'package:modu_3_dart_study/20250710/model/company.dart';
import 'package:modu_3_dart_study/20250710/model/user.dart';
import 'package:modu_3_dart_study/20250710/model/geo.dart';

extension GeoMapper on GeoDto {
  Geo toGeo() {
    return Geo(
        lat: lat ?? '',
        lng: lng ?? '');
  }
}

extension CompanyMapper on CompanyDto {
  Company toCompany() {
    return Company(name: name ?? '', catchPhrase: catchPhrase ?? '', bs: bs ?? '');
  }
}

extension AddressMapper on AddressDto {
  Address toAddress() {
    return Address(street: street ?? '', suite: suite ?? '', city: city ?? '',
        zipcode: zipcode ?? '', geo: geo?.toGeo() ??  Geo(lat: '', lng: ''));
  }
}

extension UserMapper on UserDto {
  User toUser() {
    return User(
      id: id ?? 0,
      name: name ?? '',
      username: username ?? '',
      email: email ?? '',
      address: address?.toAddress() ?? Address(
        street: '',
        suite: '',
        city: '',
        zipcode: '',
        geo: Geo(lat: '', lng: ''),
      ),
      phone: phone ?? '',
      website: website ?? '',
      company: company?.toCompany() ?? Company(name: '', catchPhrase: '', bs: '')
    );
  }
}