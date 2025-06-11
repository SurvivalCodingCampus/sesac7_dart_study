class Person{
  String name;
  int birthYear;
  int _age = 0; 
  // age 프로퍼티를 통해 나이를 제공하지만 임의로 수정은 불가능하다

  Person({this.name = '', this.birthYear = 0, int age = 0}){
    this.age = age;
  }
  
  // 나이계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴한다
  set age(int countAge){
    final now = DateTime.now();
    _age = now.year - countAge;
  }
}