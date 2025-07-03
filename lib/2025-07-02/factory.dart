class Person {
  final String name;

  const Person({required this.name});

  // 컴파일 타임에 확정되고 런타임에 조작할 수 없음
  Person.fromJson(Map<String, dynamic> json) :
    name = json['name'];
    // this 는 여기서 가능하다

  // factory는 미리 조작해서 런타임에 조작해서 리턴 할 수 있음
  factory Person.fromJson2(Map<String, dynamic> json) {
    return Person(name: json['name']); 
    // return 값 만들어주면 된다
    // return 은 이건 매번 새로운 인스턴스
    // 객체를 새로 만들어서 리턴 하는것임
  }

  // named 생성자와의 차이

  // factory 는 매번 찍어내겠다, singleton 은 한번만 만들겟다

  Person.internal(this.name);
}