class UserDto {
  int? id;
  String? name;
  int? age;
  String? address;
  String? phoneNumber;

  UserDto({this.id, this.name, this.age, this.address, this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  @override
  String toString() =>
      "AppUserDto(id: $id, name: $name, age: $age, address: $address, phoneNumber: $phoneNumber)";

  @override
  int get hashCode => Object.hash(id, name, age, address, phoneNumber);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          age == other.age &&
          address == other.address &&
          phoneNumber == other.phoneNumber;
}
