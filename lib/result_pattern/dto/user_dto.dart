class UserDto {
  UserDto({
    this.id,
    this.name,
    this.age,
    this.address,
    this.phoneNumber,
  });

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
  }

  Object? id;
  String? name;
  Object? age;
  String? address;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['age'] = age;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    return map;
  }
}
