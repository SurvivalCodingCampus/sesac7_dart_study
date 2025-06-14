## Interface(인터페이스)
  - 모든 메서드가 추상 메서드여야한다. (추상 메서드만 가지는 추상 클래스는 인터페이스와 동일)
  - 필드를 가질 수 없다.
  - abstract interface keyword를 사용한다.
    ```dart
    abstract interface class Move {
      void run();
    }
    ```
  - 구현은 Implements keyword를 사용한다.
    ```dart
    abstract interface class Move {
      void run();
    }
    
    class Person implements Move {
      void run() {
        print('사람이 달린다.');
      }
    }
    ```
  - 인터페이스는 한 클래스에서 여러개를 구현할 수 있다.
    ```dart
    abstract interface class Move {
      void run();
    }

    abstract interface class Surviver [
      void eat();
    }

    class Person implements Runnable Move, Surviver {
      @override
      void run() {
        print('사람이 달린다.');
      }

      @override
      void eat() {
        print('사람이 생존을 위해 식사를 한다.');
      }
      ...
    }
    ```
  - ### 인터페이스의 효과
    - 동일한 Interface를 Implements한 Class는 해당 Interface에 정의된 추상 메서드를 공통으로 구현하고 있음을 보장한다.
      ```dart
      abstract interface class Move {
        void run();
      }

      class Person implements Move {
        @override
        void run() {
          print('사람이 달린다.');
        }
        ...
      }
      
      class Animal implements Move {
        @override
        void breathe() {
          print('동물이 달린다.');
        {
        ...
      }
      ```
  - ### Interface끼리 implements할 수 있다.
    ```dart
    abstract interface class Move {
      void run();
    }

    abstract interface class Surviver, Move [
      void eat();
    }
    ```
  - uml
    - interface keyword를 사용한다.
    - Itrlic체로 다이어그램에 표출된다.
      
