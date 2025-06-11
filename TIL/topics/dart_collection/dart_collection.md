# Dart 컬렉션션
## 데이터 구조에 따른 대표적인 컬렉션 (자료구조)

- List : 순서대로 쌓여있는 구조 (아이템의 중복 허용)
- Map : 키(key)와 값(value)의 쌍으로 저장 (키의 중복 불가)
- Set : 순서가 없는 집합 (중복 불가)

### Dart에는 Array(배열)이 없고 List만 있다

### List 문법

- 크기를 정해두지 않고 요소를 추가할 때 마다 크기가 커

```dart
// 타입을 지정하고 사용하자
final names2 = <String>[];
names2.add('aaa');
names2.add('aaa');
names2.add('aaa');

// 휴먼 에러 확률이 높아진다
final names3 = [];
names2.add('aaa');
names2.add(1);
names2.add(true);
```

### List의 탐색 방법

```dart
// 1
for (int i = 0; i < names.length; i++) {
	print(names[i]);
}

// 2
for (final name in names) {
	print(name);
}

// 3
names.forEach((name) {
	print(name);
});

// 4
name.forEach(print);
```

### Set

- 중복 값을 허용하지 않는 집합
- get() 메서드는 제공하지 않기 때문에 반복이 필요하면 Iterator를 사용하거나 forEach()를 사용
- List의 contains 보다 압도적으로 빠름

```dart
Set<int> lottoSet = {1, 2, 3, 4};

print(lottoSet.contains(1));   // true
print(lottoSet.contains(5));   // false

lottoSet.add(5);
lottoSet.add(5);
lottoSet.add(5);
lottoSet.add(5);
print(lottoSet); // 1 2 3 4 5 

print(lottoSet.contains(5));   // true
```

### Iterator

- List나 Set은 요소를 탐색할 수 있는 iterator를 제공한다

```dart
List<int> subjects = [10, 50, 100, 100, 50];

// iterator 활용법
final iterator = subjects.iterator;
while (iterator.moveNext()) {
	print(iterator.current);
}
```

```dart
Set<int> lottoSet = {1, 2, 3, 4, 5, 6};

// iterator 활용법
final iterator = lottoSet.iterator;
while (iterator.moveNext()) {
	print(iterator.current);
}
```

### Map

- 키(key) : 값(value)의 쌍으로 이루어진 요소를 담는 자료구조
- 키의 중복은 허용되지 않는다
- Map은 순서를 보장하지 않는다
- Map을 사용하는 거보다는 그냥 클래스로 만들어서 사용하자 ( 네트워크 통신 때는 사용)

```dart
Map<String, dynamic> gildong = {
	'name' : '홍길동',
	'id' : 0,
	'age' : 20,
};

// forEach
gildong.entries.forEach((element) {
	print(element.key);
});

gildong.entries.forEach((element) {
	print(element.value);
});

// for
for (var element in gildong.entries) {
    print(element.key);
}

for (var element in gildong.entries) {
    print(element.value);
}
```

### type safety

- dynamic은 Map말고는 사용하지 말자

```dart
void main() {
	// type safety
	var name4 = '홍길동';
	// name4 = 1; 불가
	print(name4.length);

	// type safety 완전히 반한다. 금지
	dynamic name5 = '홍길동';
	name5 = 1;
	name5 = true;
	name5 = null;
	print(name5.length);
	
	// 뭐가 리턴될지 모른다
	something('홍길동');
}

// 뭐가 들어갈지 모른다
void something(name) {
	print(name + 1);
}
```

### 컬렉션의 응용

- 컬렉션 안에 컬렉션 (예시)
    - Map<String, List<String>>
    - List<List<Hero>>

```dart
// Map과 List의 조합
List<Map<String, dynamic>> students = [
	{
		'name' : '홍길동',
		'id' : 0,
		'age' : 20,
	},
	{
		'name' : '한석봉',
		'id' : 1,
		'age' : 22,
	},
];
```

## 요소의 참조에 대해

```dart
Hero hero = Hero(name: '홍길동', hp: 100);

List<Hero> heroes = [
	hero,
];

hero.name = '한석봉';

print(heroes[0].name); // 한석봉
```

- 이 코드에서 참조하고 있는 인스턴스는 hero 한 개뿐이기 때문에 값이 변한다

## 컬렉션 선택

- key, value 쌍 : Map
- 중복 가능 : List
- 중복 불가 : Set
- 순서 중요 : List
- 순서 안 중요 : Set
- 검색 속도 중요 : Set

### 연습문제 1

1. 대한민국의 도시 이름 모음 (순서 상관 없음) : Set, Map
    - 도시 이름 모음에는 순서가 딱히 상관이 없기 때문이다
    - 만약 도시 이름이 중복되는 경우가 있다면 위치(key), 도시 이름(value)의 Map 저장 가능
2. 10명의 학생의 시험 점수 : Map (List)
    - 어떤 학생의 점수인지 알기 위해서는 학생(key), 점수(value)의 Map으로 저장 가능
    - 등수가 필요하다면 List와 Map을 같이 사용하는 것도 가능하다 생각
3. 대한민국의 도시별 인구수 (순서 상관 없음) : Map
    - 도시(key)별 인구수(value)로 정보를 저장하기 좋다