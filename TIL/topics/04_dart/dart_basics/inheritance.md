# 상속(iuheritance)

- 이전에 만든 클래스와 닮았지만, 일부 다른 클래스를 만들 필요가 있을경우 확장해서 사용
- 원래 있던 내용에서 덧붙여서 확장된 개념
- 기존의 성질을 필수로 가지고 있어야 함
- extends 를 사용하여서 정의할 수 있다

```dart
class SuperHero extends Hero{}
```
- 생성자는 명시적으로 sub class 에서 재작성해야함
- super class 에서 생성자에 직접적으로 기본값을 설정한 경우에는 자동완성으로 불러올 수 없음
- sub class 에서 생성자의 속성을 추가할 수 있다

```dart
class Hero{

  String name;
  int hp;

  Hero({required this.name, this.hp = 0});

  // 싸우기와 도망만 되는 Hero 클래스
  void attack(Slime slime){
    print('$name 이 $slime 을 공격했다');
    hp -= 10;
  }

  void run(){
    print('$name 이 도망쳤다');
  }
}

// Hero 에서 상속받은 SuperHero
class SuperHero extends Hero{
  SuperHero({required super.name});

  // super의 의미는 super class
  // SuperHeor 는 sub class
}
```

- super 키워드는 부모 객체를 참조
- super class(부모 객체)에서 required 인 값은 sub class 에서 꼭 재명시

## 생성자를 호출 하지 않으면 에러 발생하는 경우
- 클래스에는 기본적으로 생성자가 있다고 판단하고 호출함
- 부모 클래스의 생성자가 어떤 인자를 요구하는지 자식 클래스는 모른다고 판단함

```dart
// 부모 클래스가 인자를 가지고 있지 않은 경우에는 가능
class Hero{}
class SuperHero extends Hero{}
```

```dart
// 부모 클래스가 인자를 가지고 있는 경우 에러 발생
class Hero{
  String name;

  Hero(this.name);
}
class SuperHero extends Hero{}
```
- 자식 클래스에서 생성자를 명시하지 않았을때 super()를 호출한다
- super 생성자는 하위 클래스를 초기화 하기 전에 상위 클래스가 제대로 초기화 되었는지 확인하기 위해 호출된다
- super 클래스 생성자에 인수를 전달해야하는 경우(초기화해야하는 경우) 생성자를 명시적으로 호출해야 하고 초기화 하지 못하면 에러 발생
- 클래스 계층구조에서 초기화를 위해서 super 생성자를 호출하는것이 필수적이다

## 올바른 상속
- **is-a 원칙** 이라고 하는 규칙에 따른 상속을 말한다: 자식 클래스 is-a 부모 클래스
- SuperHero 는 Hero 의 한 종류이다
- 상위로 올라갈수록 포괄적인 의미를 가지고 있어야 함: 자식 클래스 일수록 구체화, 부모 클래스 일수록 추상적인 것으로 일반화

## 인스턴스
- 인스턴스는 내부에 부모 클래스의 인스턴스를 가지는 다중구조
- 보다 외측(자식 클래스)의 인스턴스에 속하는 메소드가 우선적으로 동작
- 외측의 인스턴스에 속하는 메소드는 super를 사용하여 내측 인스턴스의 멤버에 접근할 수 있다

## 생성자 동작
- 다중구조의 인스턴스 생성
- 가장 외측, 가장 하위 클래스 인스턴스의 생성자가 호출
- 모든 생성자는 부모 인스턴스의 생성자를 호출한다