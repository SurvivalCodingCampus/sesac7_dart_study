# Collection
## Map
- key, value 쌍으로 값 저장
- 순서, key 중복 없음
```dart
final Map<String, dynamic> person1 = {};
final person2 = <String, dynamic>{};
final person3 = {'name': '홍길동', 'age': 20};
```

## List
- 순서, 중복 있음
```dart
final List<int> somethings1 = [];
final somethings2 = <int>[];
final somethings3 = [1, 2, 3];
```

## Set
- 순서, 중복 없음
```dart
final Set<int> somethings1 = {};
final somethings2 = <int>{};
final somethings3 = {1, 2, 3};
```

## 선택 기준
- key, value 쌍: Map
- 중복 가능: List
- 중복 불가: Set
- 순서 중요: List
- 순서 안 중요: Set
- 검색 속도 중요: Set

### 연습 문제
#### 다음 정보를 저장하기 좋은 컬렉션을 고르시오. 그 이유는?
- 대한민국의 도시 이름 모음(순서 상관 없음)
	- 이름이 전체 주소를 포함하여 도시 이름의 중복이 상관 없을 경우 -> Set(검색 속도가 중요할 가능성 높음)
	- 이름이 전체 주소를 포함하지 않아 도시 이름의 중복이 중요할 경우 -> Map(상위 주소를 key로 사용)

- 10명 학생의 시험 점수
	- 학생의 이름과 점수를 같이 저장해야 하는 경우 -> Map(학생의 이름을 key로 사용)
	- 점수만 저장하면 되는 경우 -> List(점수순으로 정렬할 가능성 높음)

- 대한민국의 도시별 인구수(순서 상관 없음)
	- 도시 이름과 같이 저장해야 할 경우 -> Map(도시 이름을 key로 사용)
	- 인구수만 저장하면 되는 경우 -> List(인구수순으로 정렬할 가능성 높음)