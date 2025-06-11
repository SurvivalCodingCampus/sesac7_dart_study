class Person {
  String name;

  Person(this.name);
}

void main() {
  /*
  ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
  그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
  “홍길동의 나이는 20살”
  “한석봉의 나이는 25살”
  */

  final Map<String, dynamic> gildong = {'name': 'gildong', 'age': 20};

  final Map<String, dynamic> seokbong = {'name': 'seokbong', 'age': 25};

  print('${gildong['name']}의 나이는 ${gildong['age']}살');
  print('${seokbong['name']}의 나이는 ${seokbong['age']}살');

  /*
  이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
  이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
  List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
  */

  Person honggildong = Person("gildong");
  Person hanseokbong = Person("seokbong");
  final List<Person> people = [];
  people.add(honggildong);
  people.add(hanseokbong);

  for (final person in people) {
    print(person.name);
  }
}
