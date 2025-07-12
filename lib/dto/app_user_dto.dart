class AppUserDto {
  int? userId;
  int? id;
  String? title;

  AppUserDto({this.userId, this.id, this.title});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title};
  }

  factory AppUserDto.fromJson(Map<String, dynamic> json) {
    return AppUserDto(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
    );
  }

  @override
  String toString() => "AppUserDto(userId: $userId,id: $id,title: $title)";

  @override
  int get hashCode => Object.hash(userId, id, title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUserDto &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title;
}
