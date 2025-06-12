## Encapsulation(캡슐화)
  - 멤버 혹은 클래스의 접근성을 제어할 수 있다.
  - 휴먼에러가 발생하지 않도록 하기 위함(Ex. 속성 값을 잘못 입력하는 행위 등)
  - ### 멤버와 클래스에 대한 접근지정
    - private 접근지정
      - 동일 파일내에서만 접근 가능 (해당 클래스)
      - Dart의 경우 이름앞에 _를 붙인다.
        ```dart
          class _Person {
            String _name = '박기택';
            ...
          }
        ```
      - 변수 혹은 상수의 private 처리 후 생성자 namedParmeter로 초기화 시 initailizerList 방식으로 초기화 필요
        ```dart
          class Person {
            String _name;
            int _age;
            Person({required name, required age}): _name = name, _age = age;
            ...
          }
        ```
      - uml 작성시 다이어그램 기호: -
    - public
      - 기본값이다.
      - 모든 클래스에서 접근 가능
  - ### Getter / Setter
    - Getter / Setter 메서드를 통해 캡슐화를 하여 접근 가능하도록 하는 방식 Property
    - 메서드를 경유하여 필드를 조작
    - getter
      - 외부에서는 상수처럼 보이지만 메서드와 동일
      - 'get' 키워드와 함께 '=>'를 사용하여 작성
        ```dart
          class Person {
            String _name;
            String get name => _name;
            ...
          }
        ```
    - setter
      - value의 타당성 검사를 할 수 있다.
        ```dart
          class Person {
            String _name;
            set name(String value) => {
              if (value.length > 3) {
                _name = value;
              }
            };
            ...
          }
        ```

    
