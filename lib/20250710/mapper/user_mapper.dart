
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
    final Geo geoInfo;

    if(geo == null) {
      geoInfo = Geo(lat: '', lng: '');
    } else {
      geoInfo = geo!.toGeo();
    }

    return Address(street: street ?? '', suite: suite ?? '', city: city ?? '',
        zipcode: zipcode ?? '', geo: geoInfo);
  }
}

extension UserMapper on UserDto {
  User toUser() {
    final Address addressInfo;
    final Company companyInfo;

    if(address == null) {
      addressInfo = Address(street: '', suite: '', city: '', zipcode: '',
          geo: Geo(lng: '', lat: ''));
    } else {
      addressInfo = address!.toAddress();
    }

    if(company == null) {
      companyInfo = Company(name: '', catchPhrase: '', bs: '');
    } else {
      companyInfo = company!.toCompany();
    }

    return User(
      id: id ?? 0,
      name: name ?? '',
      username: username ?? '',
      email: email ?? '',
      address: addressInfo,
      phone: phone ?? '',
      website: website ?? '',
      company: companyInfo
    );
  }
}