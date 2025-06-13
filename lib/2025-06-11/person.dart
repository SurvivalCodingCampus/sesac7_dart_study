class Person{

  // 한번 정해지면 수정이 불가하다
  final String name;
  final int birthYear;

  // age 프로퍼티를 통해 나이를 제공하지만 임의로 수정은 불가능하다
  Person({this.name = '', this.birthYear = 0});
  
  // 나이계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴한다
  int get age{
    final now = DateTime.now();
    return now.year - birthYear;
  }
}