void main() {
  // 아래와 같이 타입을 꼭 지정해서 쓸 것.
  final List<String> names = [];

  final names2 = <String>[];
  names2.add('add');
  names2.add('add');
  names2.add('add');

  names2.forEach((name) {
    print(name);
  });

  // 이렇게 쓰면 안됨!
  final names3 = []; // dynamic
  names3.add('add');
  names3.add(2);
  names3.add(true);

  // 금지!!
  dynamic a = 3;
  a = 'add';
  a = true;

  something(a);

  // Set
  final Set<int> lottoSet = {1, 2, 3, 4};
  final lottoSet2 = <int>{1, 2, 3, 4};
  lottoSet.add(5);
  print(lottoSet);

  // Map
  Map<String, dynamic> person = {'name': '홍길동', 'id': 0, 'age': 20};
}

something(name) {
  print(name);
}
