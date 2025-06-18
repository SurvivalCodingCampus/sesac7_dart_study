# Variables and Constants in Dart

## 1. 상수

### 컴파일 타임 상수 vs 런타임 상수
1. 컴파일 타임 상수: const
    - 컴파일 타임 상수는 미리 사전에 메모리가 만들어져 있고 사용하지 않아도 메모리가 할당되어 있음
    - 프로그램 실행여부와 상관없이 메모리 할당
    - Dart는 선컴파일 방식이라 Flutter 앱을 만들면 const 값은 실행 파일안에 미리 있음
    - 메모리 위치 : 정적 메모리

2. 런타임 상수: final
    - 값이 한번만 설정됨
    - 설정되는 시점은 실행 시점 runtime
    - 메모리 위치: 런타임 힙
    - 실행시 동적으로 결정되는 값들은 알 수 없기 때문에 final 사용

3. static const: 클래스에 고정시키고, 모든 파일에서 재사용 할 수 있도록 함
    - static const(final)은 계속 모든 파일에서 반복적으로 사용시에 고정함
    - static 붙이는 순간 static 을 포함하고 있는 class 와는 관계가 없는 상태가 된다
    - 해당 클래스 이름.인스턴스 이름 과 같은 형식으로 조회해야 한다
    - 인스턴스를 생성하지 않아도 정적 필드에 접근이 가능하다
    - class 안에 있지만 독자적인 기능

4. top-level: 함수 밖에 선언하여 모든 파일에서 재사용 할 수 있도록 함
```dart
int money = 100;

class Person{
  // 생성자를 작성하지 않았을때 Person(); 이 있는 것으로 판단하고 사용 가능
}

Person(); 
  // 생성자를 작성하지 않을 시에만 기본 생성자가 있는 것으로 본다
  // 생성자 만드는 순간 기본 생성자는 사라진다

```

5. 정적 메소드

```dart
class Hero{

  static void setRandomMoney(){
    money = Random().nextInt(100);
    
    // 인스턴스 멤버로는 접근 불가
    print('$name의 소지금을 추가했다');
  }
}

// 정적 메소드 호출
void main(List<String> arguments){
  Hero.setRandomMoney();

}
```
- 정적 메소드 안에서 엑세스 할 수 있는 것은 정적 멤버만 가능
- 클래스의 인스턴스가 없어도 실행되기 때문에 인스턴스 멤버에는 접근할 수 없다