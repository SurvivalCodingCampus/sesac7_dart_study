class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  @override
  String toString() {
    return '$name, $catchPhrase, $bs';
  }
}
