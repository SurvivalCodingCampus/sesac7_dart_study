class UserDto {
  UserDto({
    this.id,
    this.name,
  });

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  dynamic? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  @override
  bool operator ==(Object other) {
    if (other is! UserDto) return false;

    return id == other.id && name == other.name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
