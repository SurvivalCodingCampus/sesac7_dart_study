# Dart 생성자(constructor)

## 1. 클래스로부터 인스턴스(붕어빵)를 만들때 처음 실행되는 함수!
- 클래스:  설계도, 앞에 new 가 생략된 형태로 작성
- Q. 클래스 필드에 const를 사용할 수 있나요?
- A. 클래스 필드에는 static const 만 사용가능하다. 인스턴스 필드는 final을 사용해야 한다.
- A. 생성자는 런타임에 생성되는 함수이기 때문에 컴파일 타임에 생성되는 const 를 필드값으로 설정할 수 없다.
- A. 클래스가 인스턴스화 되었을때 사용하는 값들이 필드에 있기 때문에 필드에 직접적으로 const 사용 불가

## 2. 괄호에 따라 생성자 모양 차이
- `Name()`: 기본 생성자
- `Name(String firstName)`: 위치기반 매개변수
- `Name(this.firstName)`: 필드를 바로 초기화하는 축약 문법
- `Name({this.name})`: 이름 있는 매개변수(선택가능), named parameter
- `Name({required this.name})`: 이름 있는 매개변수(필수 지정), 데이터 타입이 null 을 허용하지 않으면 required 를 붙여야 함
- `Name(this.hp, this.mp,{required this.name})` 필수 parameter 와 named parameter를 동시에 사용할 경우 필수 parameter 가 앞에 와야함
- named parameter 에서만 기본값 지정이 가능