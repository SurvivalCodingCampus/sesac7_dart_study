import 'package:modu_3_dart_study/hero.dart';

void main() {
  ///타입을 꼭 넣자.
  List<String> names = [];
  final names2 = <String>[];

  ///위에거는 타입이 String으로 제한이됨.
  ///
  names2.add('aaa');
  names2.add('bbb');
  names2.add('ccc');
  names2.add('ddd');
  names2.add('eee');
  names2.remove('aaa');

  final names3 = [];
  names3.add('bbb');
  names3.add(1);
  names3.add(true);
  bool isContain = names2.contains('aaa');
  for (final name in names3) {
    print(name);
  }

  ///Dart에는 dynamic 이라는 타입이 있다.
  ///dynamic을 타입으로 하면
  ///var로 타입을 설정하면 타입세이프티 때문에 다른 타입값으로 바꿀 수 가 없는데,
  ///dynamic으로 타입을 설정하면 다른 타입의 값으로 값을 설정할 수 있다.

  ///dynamic을
  ///어떤 함수를 만들었는데
  ///타입을 지정하지않으면 기본적으로 dynamic타입이다.
  ///dynamic은 런타임에 다 허용을 하겠다. -> 컴파일타임에 그냥 넘어감. => 오류발생가능.
  /// 그니까 타입지정을 꼭 하자..
  /// 타입생략은 조심해라. dynamic인지 아닌지, 잘 캐치해가지고. dynamic쓰지않게.
  var names5 = '홍길동';
  dynamic names4 = '홍길동';

  Set<int> set = {1, 2, 3, 4};
  final lottoSet = <int>{1, 2, 3, 4};
  final loSet = {1, 2, 3, 4};

  lottoSet.add(6);
  lottoSet.remove(1);
  bool is3Contain = lottoSet.contains(3);

  /// Iterator 프로퍼티.

  final it = lottoSet.iterator;
  while (it.moveNext()) {
    print(it.current);
  }

  set.forEach(print);

  Map<String, dynamic> person = {'name': '홍길동', 'age': 10};

  ///entries 프로퍼티를 통해서 키 - 값에 접근 가능.
  person.entries.forEach((element) {
    print(element.key);
    print(element.value);
  });

  ///응용

  List<Map<String, dynamic>> students = [
    {'name': '홍길동', 'age': 10},
    {'name': '상태', 'age': 20},
  ];

  Hero hero = Hero(name: '홍길동', hp: 100);
  List<Hero> heroes = [hero];
  hero.name = '한석봉';
  print(heroes[0].name); //한석봉

  ///인스턴스가 1개야. 지금은. 등장인물이 이거 hero한명이기때문에, 레퍼런스로 연결이 되어있다. hero랑 heroes[0]이랑은 같은 주소 가지고있다.
}
