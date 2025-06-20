enum KeyType {
  padlock(count: 1024),
  button(count: 10000),
  dial(count: 30000),
  finger(count: 1000000);

  const KeyType({required int count}) : _count = count;

  final int _count;

  int get count => _count;
}
