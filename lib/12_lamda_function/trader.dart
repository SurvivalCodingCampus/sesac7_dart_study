class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return '{name: $name, city: $city}';
  }
}
