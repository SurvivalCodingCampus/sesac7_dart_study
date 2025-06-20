/*
다음 조건을 만족하는 금고인 StrongBox 클래스를 정의하시오.
01. 금고 클래스에 담는 인스턴스의 타입은 미정
02. 금고에는 1개의 인스턴스를 담을 수 있음
03. put() 메서드로 인스턴스를 저장하고 get() 메서드로 인스턴스를 얻을 있음
04. get() 으로 얻을 때는 별도의 타입 캐스팅을 사용하지 않아도 됨
* */

class StrongBox<T> {
  T? _data;

  void put(T data) {
    _data = data;
  }

  T? get() {
    return _data;
  }
}

class Person{
  String name;
  int age;

  Person({required this.name, required this.age});
}
void main() {
}