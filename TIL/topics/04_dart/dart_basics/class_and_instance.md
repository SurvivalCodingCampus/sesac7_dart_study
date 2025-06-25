# 클래스와 인스턴스

## 객체(object)
- 현실 세계의 모든 객체

## 클래스(class)
- 오브젝트를 가상세계 용으로 구체화 한 것(붕어빵 틀)
- 인스턴스를 생성하기 위한 틀이 클래스

## 인스턴스(instance)
- 클래스를 활용해 메모리 상에 만들어 낸 것(붕어빵)

## 클래스 타입
1. 클래스를 정의하면 사용자가 정의한 타입이 생성됨
```dart
class Hero{...}
```

2. 클래스 타입의 변수를 선언할 수 있음
```dart
Hero hero1;
```

3. 어떤 클래스 타입 변수는 그 클래스의 인스턴스를 담을 수 있음
```dart
hero1 = Hero('홍길동', 100);
```

## 인스턴스화
- new 키워드를 사용하여 클래스(붕어빵틀)로 부터 생성자를 통해 인스턴스(가상세계 붕어빵)를 생성
```dart
class Hero{
  
  String name;
  int hp;

  Hero(this.name, this.hp); //생성자

  void attack(){
    hp--;
  }

  void sayHi(){
    print('안녕, 나는 $name!');
  }

}

void main(){
    Hero hero1 = new Hero('홍길동',100);
}
```

- dart에서 new 키워드는 생략 가능
- 클래스 타입 변수에 인스턴스가 담겨있을때 "변수명.필드명" 이나 "변수명.메소드명()" 으로 그 인스턴스의 필드나 메소드를 이용할 수 있음
```dart
print(hero1.name);
hero1.attack();
```
