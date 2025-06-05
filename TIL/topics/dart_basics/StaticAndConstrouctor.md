## Class
---
* ### Constrouctor(생성자)
  - 인스턴스를 생성하는 방법을 제공하는 것
  - namedParamer를 사용하여 가독성 증가(Flutter에서 자주 사용)
 
    ```
      \\ {}를 사용하면 NamedParameter를 사용할 수 있다.
      SomeThing({String name = 'name', this.hp = 0});
    ```
    + 필수 파라미터와 같이 사용 시 필수 파라미터가 앞으로 오고 뒤에 named 파라터가 온다.
    + named 파라미터에서만 기본값을 지정할 수 있고, 이 값은 const해야한다.
   - Dart의 경우 overloading을 따로 지원하지 않으며 생성자 중괄호 조합으로 여러개를 만들 수 있다.
   - 생성자를 만들지 않고 생성을 시도한다면 모든 클래스는 반드시 1개의 생성자를 가져야해서 자체적으로 기본 생성자를 사용한다.
* ### Static(정적 영역)
  - static을 붙이는 순간 해당 클래스의 필드내 메모리에 속하지 않게된다. (무관계)
    ```
      class SomeThing {
        static int num = 0;
        ...
      }

      void main() {
        // SomeThing 클래스의 Instance 생성전 메모리에 올라가기전 사용가능
        final int a = SomeThing.num;
        final someThing = SomeThing();
      }
    ```
  - top-level에서 사용시 코드가 작성된 Class 이름없이 호출 가능하다.
  - static 메서드내에서는 static 멤버만 사용가능하고 사용하려면 Instance를 생성해서 사용해야한다.
