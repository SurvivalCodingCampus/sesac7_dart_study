## Inheritance(상속)
  - super class의 멤버를 사용해서 중복을 최소화할 수 있다.
  - 코드의 복사 / 붙여넣기의 문제점을 해결할 수 있다. (결국 휴먼 에러 방지)
  - class 이름 옆에 extends keyword를 사용한다.
  - super class의 멤버를 재정의해서 확장성을 높일 수 있다.
    - extends keyword 및 override 사용한 상속
      ```dart
      // Super Class
      class Person {
        void run() {
          ...
        }
        ...
      }

      // Sub Class
      class Man extends Person {
        @override
        void run() {
          super.run(); // Super Class의 Person의 run Method를 실행
          // 재정의
          ...
        }
        ...
      }
      ```
- Sub Class의 생성자에서 Super Class의 생성자를 만들어 준다.
  ```dart
  // Super Class
  class Person {
    String name;
    int age;
  
    Person({required this.name, required this.age});
  }
  
  // Sub Class
  class Man extends Person {
    Man(super.name, super.age);
    ...
  }
  ```
- ### 올바른 상속
  - is-a 원칙이라는 규칙에 따른 상속
    - SubClass is a SuperClass
- ### 잘못된 상속
  - is-a 원칙 위배
    - is-a 원칙 위배 시 객체지향 3대원칙 중 하나인 다형성을 이용할 수 없다.
- ### 추상화
  - SubClass에서 구체화된 부분에서 중복으로 필요한 것들을 SuperClass에서 추상화한다.
- ### 다중상속 금지
  - Dart에서는 다중상속을 금지한다.
  - Dart에서는 Mixin을 제공해서 다중상속이 가능은 하나 flutter 개발 시 사용하는 경우가 있다.









  
    
