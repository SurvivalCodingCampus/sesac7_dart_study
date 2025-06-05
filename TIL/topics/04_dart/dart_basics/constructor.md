# Dart 생성자(constructor)

## 1. 클래스로부터 인스턴스(붕어빵)를 만들때 처음 실행되는 함수!
- 클래스:  설계도, 앞에 new 가 생략된 형태로 작성
- Q. 클래스 안에서 const로 상수 설정하는것은 불가?
- A. 생성자는 런타임에 생성되는 함수이기 때문에 컴파일 타임에 생성되는 const 를 필드값으로 설정할 수 없다.

## 2. 괄호에 따라 생성자 모양 차이
- `Name()`: 기본 생성자
- `Name(String firstName)`: 위치기반 매개변수
- `Name(this.firstName)`: 필드를 바로 초기화하는 축약 문법
- `Name({this.name})`: 이름 있는 매개변수(선택가능), named parameter
- `Name({required this.name})`: 이름 있는 매개변수(필수 지정)