import 'package:modu_3_dart_study/hero.dart';

void main() {
  // final numbers = [1, 3, 2];
  // print(numbers);

  // numbers.sort();
  // print(numbers);
  //
  // final num = numbers.sorted((a, b) => -a.compareTo(b));
  // print(num);

  // 아래 방식은 쓰지말자.
  // final num2 = numbers..sort((a, b) => a.compareTo(b));
  // print(num2);

  ///우리는 정렬할 때, sorted를 쓰자.
  ///원본은 변하지 않고, 복사본을 만들어 정렬.
  // final List<int> sorted = numbers.sorted((a, b) => -a.compareTo(b));
  // print(sorted);
  // print(numbers);

  List<Hero> heroes = [
    Hero(name: '홍길동', hp: 100),
    Hero(name: '김길동', hp: 50),
    Hero(name: '박길동', hp: 200),
  ];
  heroes.sort();
  print(heroes);

  ///이게 왜 터지냐? 이거 안된다. 오류난다. type Hero is not a subtype of type 'Comparable<dynamic>' in type cast 오류.
  ///Comparable이 뭐냐?
  ///리스트는 기본적으로 Comparable을 구현하고 있는데, 리스트는 인터페이스인데, 다른 인터페이스 2개를 또 구현중인데, 그중 1개인 반복자.
  ///반복자를 까고 들어가면, 계속 들어가면,
  ///아니 int -> num -> Comaprable 들어가면 , compareTo가 있는 애들은 sort가 되게 해주겠다. 변하게 쓸수있게, comparable이 구현된 애들은 compare()를 통해 정렬을 할 수있는데,
  ///String도 Comparable을 구현하고있고,
  ///Comparable 타입으로 선언해도 가능.
  ///
  // Comparable ccc = 10;
  // Comparable bbb = '홍길동';

  ///이런 애들은 리스트가 sort를 해주는데, Hero는 얘가 안돼. 그래서 오류가 나.
  ///int 나 String은 있는데, Hero는 없어서 Comparable을 각각 구현하고 재정의를 하면 가능함.

  ///이게 기본인데, 뭐냐면.
  ///
  /// Comparable 를 구현해서 compareTo()를 가지고 있는 애들은 비교 정렬 가능.
  /// 그 규칙은 compatator를 따르고,
}
