# 람다식(lambda) 과 함수

## 1급 객체: 변수에 대입 가능한 객체(first class object, first class citizen)
- 대표적인 1급 객체: 값, 인스턴스, 함수
- dart에서는 함수도 1급 객체

## 함수
- 같은 값을 넣으면 항상 같은 값이 나오는 것이 함수

```dart
// 함수의 표현 방법
int add(int a, int b) {
    return a + b;
}

// 함수의 람다식 표현방법: 함수를 바로바로 작성해서 사용하고 싶다!
int add(int a, int b) => a + b;
```
- 함수도 객체로 받을 수 있다
- 입출력 타입만 같다면 같은 함수로 볼 수 있다
- 함수와 클래스가 동일하게 리턴값과 입력값이 같다면 객체로 받아서 사용할 수 있다

```dart
void sayHello() {
  print('안녕하세요!');
}

void sayGoodbye() {
  print('안녕히 가세요!');
}
// 단순히 출력만 하는 void 리턴 타입이고 매개변수 없음

void greet (void Function() greeting) {
    // void Function() greeting: 매개변수도 없고 반환값도 void인 함수를 받는다는 타입 명시
    gretting(); // 인자로 받은 함수를 실행
}

void main() {
  greet(sayHello);   // sayHello 함수 자체를 전달 (sayHello() 아님!)
  greet(sayGoodbye);
}

// sayHello나 sayGoodbye는 함수의 참조
// 즉 sayHello()처럼 괄호를 붙이면 “함수 호출 결과”를 넘기는 것이고, 
// 괄호 없이 sayHello를 넘기면 함수 자체를 넘기는 것
```

## 메서드와 함수의 차이

- 메서드: 클래스에 속하고 클래스를 조작하기 위한 일종의 함수
- 메서드는 이름이 있지만 함수에게 이름은 중요하지 않다

```dart
list.forEach( (element) {print(element);} );
// 이름 없는 함수 (element) {print(element);}
```

## 고계 함수(higer-order function)
- 더 높은 수준의 함수를 다루는 함수
- 함수를 데이터 처럼 취급하는 함수

### Dart 에서 제공되는 고계 함수

#### 1. where: 조건 필터링
```dart
final items = [1,2,3];

for(var i = 0; i < items.length; i++) {
    if(items[i] % 2 == 0) {
        print(items[i]);
    }
}

// where 위와 같은 결과 값
items.where((e) => e % 2 == 0).forEach(print);
```
#### 2. map: 변환

#### 3. forEach: 전체 순환
- forEach 안에 담긴것은 함수이다, forEach 안에 휴먼에러가 발생하기 쉬워서 확정지어진 것만 쓰라고 함
- 루프 중단이 되지 않음
- 모든 요소에 대해서 반드시 실행

```dart
bool g(List<int> list) {
  list.forEach((i) {
    if (i == 42) {
      return true; // 이건 함수 전체를 멈추지 못함
    }
  });
  return false;
}
```

#### 4. reduce: 하나가 될 때 까지 줄이기
- 반복 요소를 줄여가면서 결과를 만들때 사용하는 함수
- reduce input 값 output 값이 같으니까 생략해서 합쳐서 사용할 수 있다
```dart
final items = [1, 2, 3, 4, 5];
print( items.reduce((e, v) => max(e, v)));
// reduce 는 요소 타입과 같은 타입을 반환해야함
```


#### 5. fold: 하나가 될 때까지 접기

#### 6. any: 있는지 없는지: 특정요건을 충족하는 요소가 있는지를 검사할때 사용

#### 7. toList(): List 형태로 반환
- 함수형 프로그래밍을 지원하는 함수 대부분은 Iterable<T>라는 타입을 반환한다.
- Iterable<T>: 반복자
- 타입을 추론함

```dart
Iterable<int> // 숫자 반복
Iterable<String> // 문자열 반복

final result = [1, 2, 3].map((e) => e * 2);
// 이 result는 Iterable<int>
```

- 내부 상태를 직접 변경하지 않고 순수 함수형 스타일에 가깝게 작성
- 오류 가능성을 줄이고 코드량도 짧음

```dart

// 안티패턴
final result = []; // 타입 지정 누락, 외부에서 조작 가능, 런타임 오류 가능성
    items.forEach((e){ // forEach()는 내부적으로 반환 값을 사용하지 않기 때문에, 로직이 늘어나면 디버깅하기 어려움.
    if (e % 2 == 0) {
        toList.add(e); // 잘못된 위치에 추가할 수 있음
    }
});

final toList = items.where((e) => e % 2 == 0).toList();
```

#### 8. toSet(): 자료구조 Set 으로 변환하는 함수
- 중복을 허용하지 않기 때문에 간단히 중복 데이터를 제거할 수 있음

```dart
final toList = items.where((e) => e % 2 == 0).toSet().toList();
```
