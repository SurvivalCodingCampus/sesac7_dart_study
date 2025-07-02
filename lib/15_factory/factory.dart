class Person {
  final String name;

  factory Person(String name) {
    return Person(name);
  }

  // Person._internal(this.name);

  //
  Person.fromJson(Map<String, dynamic> json) : this.name = json['name'];

  //
  factory Person.fromJson2(Map<String, dynamic> json) {
    return Person(json['name']);
  }
}
