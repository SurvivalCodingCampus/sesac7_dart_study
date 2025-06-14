## AbstractClss(추상 클래스)
  - 상속을 하면서 인스턴스를 생성하면 안되는 문제와 미정의된 메서드를 정의해서 SubClass에서 구현이 필요할때 추상클래스를 사용한다.
  - implements가 가능하지만 정확한 용도로 사용해야하기 때문에 extends로 사용한다.
  - ### 추상 클래스를 사용하지 않았을 때의 문제
    - 상속의 용도로 만들어진 Character Class를 인스턴스화를 해버리는 문제가 있다.
      ```dart
      class Character {
        void run() {
        ...
        }
      }
      void main() {
        Chracter chracter = Chracter();
      }
      ```
    - 상속 클래스에 필수로 구현헤줘야하는 메서드를 SubClass에서 필수로 구현해줘야하는데 Override 받지 않거나 잘못된 메서드명으로 구현하는 경우가 있다.
      ```dart
      class Character {
        // SubClass에서 필수로 구현해줘야한다.
        void run() {}
      }
      class Person extends Character {
        void ran() {} // run을 구현해야하는데 메서드명을 잘못 입력하는 문제가 있다.
      }
      ```
  - ### 추상 클래스를 사용하기 위해서는 abstract keyword를 사용한다.
    ```dart
    abastract class Character {
      ...
    }
    ```
  - ### 추상 메서드의 경우 Scope를 열지 않고 선언한다.
    ```dart
    abastract class Character {
      void run();
      ...
    }
    ```
  - ### uml
    - class 앞에 abstract keyword를 붙인다.
    - Itrlic체로 표현

