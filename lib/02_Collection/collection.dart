/*
* 다이나믹 사용하지 말자.
* */

// void main() {
//   final List<String> names = [];
//
//   // 이걸 사용하자
//   final names2 = <String>[];
//   names2.add('aa');
//   names2.add('bb');
//   names2.add('cc');
//
//   //names2.elementAt(3);
//   //print(names2[3]);
//
//   names2.forEach(print); //print함수 인자로.
//
//   // 사용해야 하는 경우가 있다. 하지만 쓰지말자 필요한 경우를 뺴고는.
//   names2.forEach((names) {
//     print(names);
//   });
//
//   // 타입 추론이 어렵다
//   // List<dynamic> 타입임
//   final name3 = [];
//   name3.add('bb');
//   name3.add(1);
//   name3.add(true);
//
//   // dart의 특수 타입 dynamic
//   // dynamic => 절대사용금지. type safety에 반한다.
//   dynamic name4 = '홍길동';
//   var name5 = '홍'; // type safety 자료형이 정해짐
//   name4 = true;
//   name4 = 1;
//
//   // dynamic이기 떄문에...하지마라!
//   something(name) {}
//
//   // set
//   // 중복을 허용하지 않는다.
//   // 탐색을 위한 사용을 하지 않는다.
//   // 있는지 없는지 확인 하기위한 용도 contains() <-고속
//
//   final lottoSet = {1, 2, 3, 4};
//   // final lottoSet = <int>{1,2,3,4}; 생략가능
//   // add(),remove() 있다
//
//   // iterator 반복자 -> 디자인패턴에
//
//   // Map
//   // 순서를 보장하지 않는다.
//
//   // 이와 같이 쓰려면 차라리 class를 만들어 사용해야함
//   // 하지만 써야하는 경우가 있다 -> 네트워크 통신때
//   Map<String, dynamic> person = {'aa': 'q', 'ww': 1};
// }
//
// // 03. 이름을 가지는 Person 클래스를 작성하고, 다음을 수행하는 코드를 작성하시오.
// // 이름이 ‘홍길동', ‘한석봉' 인 Person 인스턴스를 생성하고, List에 담습니다.
// // List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.
//
// // 위와 같이 쓰려면 차라리 class를 만들어 사용해야기
// class Person {
//   String name;
//   int age;
//
//   Person(this.name, this.age);
// }
//