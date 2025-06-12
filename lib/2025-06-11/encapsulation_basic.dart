class Person{
  String _name = ''; // private 필드
  int _age = 0; // private 필드
  
  // 생성자에서 setter 를 안거치고 직접 저장
  // Person({required String name, required int age}) : _name = name, _age = age;

  // 세터를 통해서 인스턴스를 초기화
  Person({String name = '', int age = 0}){
    this.name = name; 
    this.age = age;
  }

  // this.변수명 = 값을 사용할때 클래스 안에 그 이름의 setter 가 있어야한다.

  // getter
  String get name => _name;
  int get age => _age;

  // setter: 함수처럼 동작
  // set name(String value) => _name = value;
  set age(int value) {
    if(value >= 0) { // 유효성 검사 추가
        _age = value;
    }
  }

  set name(String newName) {
    if (newName.length < 1) {
      throw Exception('이름이 너무 짧습니다');
    }

    if (newName.length > 8) {
      throw Exception('이름이 너무 깁니다');
    }

    _name = newName;
  }

}

void main(){
  final person = Person(name: '홍길동', age: 10);
  print(person);
}

