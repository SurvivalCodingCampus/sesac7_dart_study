enum KeyType {
  padlock(1024),
  button(10000),
  dial(30000),
  finger(1000000);

  final int tryLimit;

  const KeyType(this.tryLimit);
}
