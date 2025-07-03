class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

void main() {
  const User user1 = User(name: 'name', age: 10);
  User user2 = const User(name: 'name', age: 10);
  print(identical(user1, user2)); //

  User user3 = user1.copyWith();
  print(identical(user1, user3)); //
}
