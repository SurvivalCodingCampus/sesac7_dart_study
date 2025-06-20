# Dart collections(자료구조의 모음을 collections)

## 자료 구조
- 배열과 리스트는 자료구조
- 데이터를 어떻게 저장하고 조직하고 관리하느냐에 대한 체계나 툴
- 코드 안정성이 중요해졌기 때문에 Dart에서는 List를 사용해서 안정성을 높임

## 1. Array 배열(Dart에서는 사용하지 않음)
- 메모리 상에 연속된 칸을 일정한 크기로 확보해서 데이터를 넣는 방식
- 고정된 크기
- 빠른 속도(예측 가능)
- 크기 변경 불가

## 2. List 리스트
- 데이터를 저장하되 크기를 마음대로 조절할 수 있는 구조
- Dart 에서는 리스트도 기본적으로 배열을 기반으로 만들지만 내부적으로 자동으로 크기 조절을 해줌(default)
- Dart는 기본적으로 List 클래스가 배열의 역할 대체
- 유동적인 크기
- 검색 속도가 느림: 순차 탐색
- 순서대로 쌓여있는 구조
- 아이템의 중복 허용

```dart
void main(){

    // Q. Dart 에서 리스트의 <타입>위치가 달라지면서 달라지는게 있나? 
    // A. 동작은 동일, 명시적 타입 선언인지 타입 추론인지(제네릭 리터럴?)

    // 표기 방법: 타입 명시
    List<String> name = []; 

    // 표기 방법: 타입 추론
    final names2 = <String>[];
    names2.add('a');

    // dynamic type
    final names3 = [];
    names3.add('bbb');
    names3.add('222');
    
    // 타입을 정확하게 정해주고 사용하는게 에러 방지
    var name5 = '홍길동'; // 타입 추론되며 한번 결정된 타입이 변하지 않는다
    
    // dynamic 금지, type safety 에 완전 반대되는 성격의 타입
    dynamic name4 = '홍길동';
    dynamic name4 = true;
    dynamic name4 = null;
    dynamic name4 = '한석봉';
    print(name4.length);

    // 타입을 쓰지않으면 암묵적으로 dynamic
    // return 에도 타입을 써야한다

    // dynamic 사용시
    // null 인 경우에는 터진다
}
```

- Dart 의 List 문법
```dart
final names = <String>[];

names.add('홍길동');
names.add('한석봉');
names.add('신사임당');

print(names[1]);
// names[] = names.elementAt(3)
```

- List 의 탐색 방법
```dart
// index 가 필요할 때
for (int i = 0; i < names.length; i++) {
    print(names[i]);
}
```

```dart
// index 가 필요없을때
for (final name in names) {
    // final name 은 names 라는 리스트 안의 각 요소를 하나씩 반복문 안에서 사용할 때 부르는 이름
    print(name);
}
```

```dart
// forEach: 리스트의 각 요소에 대해 지정된 함수를 실행하는 메서드

// 이름이 없는 익명 함수를 전달
names.forEach((name){
    print(name);
});

// 이름이 있는 함수를 전달
void printName(String name){
    print(name);
}
names.forEach(printName);

// 위와 같음
names.forEach(print);
```

### List sort() 정렬

```dart
final numbers = [1, 3, 2];
numbers.sort(); // 기본제공되는 sort는 원본의 구조를 변경해버린다
numbers.sort((a, b) => b - a); // 역순정렬
numbers.sorted((a, b) => a - b); // 라이브러리에서 제공하는 sorted를 사용해서 원본의 변경없이 새로운 List 값을 사용한다
```

- 리스트는 인터페이스
- int 는 추상클래스, num 을 상속받은
- compareTo 는 num 이 준것
- num 은 comparable 한 인터페이스 타입 

임의로 정의한 리스트를 sort 할때는 어떤 기준으로 sort 할것인지 정의해주어야한다
반드시 compare 해야함 compareTo comparable 구현하면 sort 가능해짐

## 3. Map
- 키(key)와 값(value)의 쌍으로 저장
- 키의 중복 불가
- 검색 속도가 빠름
- Map은 어쩔수 없이 dynamic 타입을 쓰지만 최대한 dynamic을 쓰지 않는 방법으로 생성자를 만들어서 사용하기
- 하나의 데이터 묶음
- 여러 묶음을 사용하려면 Map 으로 한번 더 감싸서 사용할 수 있음

```dart
Map<String, dynamic> gildong = {
    'name': '홍길동',
    'id': 0,
    'age': 20,
};
```
- Map 대신 클래스 만들어서 사용하기

## 4. Set
- 순서가 없는 집합
- 중복 값을 허용하지 않는 집합
- 검색 속도가 빠름: 자주 사용하는 값인 경우 Set에 넣어두기

```dart
Set<int> lottoSet = {1, 2, 3, 4};
print(lottoSet.contains(1)); // true
print(lottoSet.contains(5)); // false
```
- get() 메서드는 제공하지 않기 때문에 반복이 필요하면 Iterator(반복자) 를 사용하거나 forEach()를 사용
- index 로 접근하는 get()이나 []는 연산 불가: 순서가 없는 자료구조이기 때문
- List의 contains 보다 압도적으로 빠름

## List나 Set의 iterator
- 요소를 탐색할 수 있는 iterator를 제공한다
- 각 요소를 순차적으로 탐색하면서 반복문 처럼 하나씩 출력

```dart
List<int> subjects = [10, 50, 100, 100, 50];

final iterator = subjects.iterator;
while (iterator.moveNext()) {
    print(iterator.current);
}
```

## 컬렉션의 응용
```dart
List<Map<String, dynamic>> students = [
    {
        'name': '홍길동',
        'id': 0,
        'age': 20,
    },
    {
        'name': '한석봉',
        'id': 1,
        'age': 22,
    },
];
```

## 요소의 참조
```dart
Hero hero = Hero(name: '홍길동', hp: 100);
List<Hero> heros = [
    hero,
];
hero.name = '한석봉';

print(heros[0].name); // '한석봉'
```
- heors 라는 이름을 가진 Hero 타입의 리스트에 hero라는 인스턴스를 하나 생성해서 넣음
- hero.name 을 한석봉으로 바꿈
- 처음 생성된 같은 인스턴스를 참조하고 있기 때문에 heros[0].name 은 한석봉

### 연습문제 1
- 대한민국의 도시 이름 모음(순서상관없음): 중복되는 값이 있을 수 있으니 List
- 10명 학생의 시험 점수: Map
- 대한민국의 도시별 인구수(순서상관없음): Map


### 복사
그래서 int 같은건 왜 복사되지?
레퍼런스 기반으로 왜?

### 얕은 복사, 깊은 복사

```dart
// 참조기반의 사용자 정의된 타입을 복사해서 사용하기 위해 copyWith 메서드 구현
  Hero copyWith({
    String? name,
    double? hp,
  }) {
    return Hero(
      name: name ?? this.name,
      hp: hp ?? this.hp,
    );
  }
```