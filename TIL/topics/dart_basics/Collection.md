## Collection(컬렉션)
  - Dart는 Array가 없음
  - ### List
    - List는 크기를 정해놓지 않고 요소를 추가할 때 마다 크기가 커짐
    - 순서가 지켜짐
    - 중복 요소를 추가할 수 있음
      ```dart
        List<Person> people = [];
        people.add(Person(name: '박기택'));
      ```
    - 요소 탐색을 위한 iterator를 제공
    - 타입 추론 형식으로 List 선언 시 제네릭으로 타입을 붙여서 타입을 지정해준다.(dynamic으로 아무 타입이나 들어올 수 있음 주의!)
      ```dart
        var people = <Person>[];
        List<Person> people = [];
      ```
  - ### Map
    - key/value 쌍으로 구성되어 요소를 저장
      ```dart
        Map<String, int> peopleMap = {};
        people['key'] = 0;
      ```
    - key는 중복될 수 없음
    - 순서가 보장되지 않음
    - entries Property를 통해서 forEach()를 사용할 수 있다.(다만 순서는 보장되지 않음)
  - ### Set
      ```dart
        Set<int> peopleAges = {20, 24, 25};
      ```
    - 중복을 허용하지 않음
    - get() 메서드를 제공하지 않음
    - 반복문 필요시 iterator 혹은 forEach()를 사용
    - search 시 contains() 메서드의 속도는 list보다 압도적으로 빠름
   
  - ### Collection KeyPoint
    - key, value 쌍 필요 시: Map
    - 중복 요소 저장 시: List
    - 중복을 허용하지 않을 시: Set
    - 요소의 순서가 중요할 시: List
    - 요소의 순서가 중요하지 않을 시: Set
    - 검색 속도가 중요할 시: Set
