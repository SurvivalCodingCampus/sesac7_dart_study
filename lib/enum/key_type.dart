enum KeyType {
  padlock(tryCount: 1024),
  button(tryCount: 10000),
  dial(tryCount: 30000),
  finger(tryCount: 1000000);

  const KeyType({
    required this.tryCount,
  });

  final int tryCount;
}
