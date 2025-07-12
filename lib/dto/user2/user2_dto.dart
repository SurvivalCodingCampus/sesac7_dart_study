class User2Dto {
  int? id;
  String? name;
  int? age;
  String? address;
  String? phoneNumber;

  User2Dto({this.id, this.name, this.age, this.address, this.phoneNumber});

  factory User2Dto.fromJson(Map<String, dynamic> json) => User2Dto(
    id: json['id'] as int?,
    name: json['name'] as String?,
    age: json['age'] as int?,
    address: json['address'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'address': address,
    'phoneNumber': phoneNumber,
  };
}
