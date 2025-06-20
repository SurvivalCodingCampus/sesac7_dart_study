## Object class
- 모든 클래스는 Object를 상속받음(암묵적)
- == , hashCode 제공

## 동등성 비교
### == operator
- List 내에서 == 으로 비교함
- Set, Map은 hashCode로 비교함
	- 검색 빠름
- 위와 같이 비교 규칙이 다르기 때문에 == 과 hashCode를 같이 override해서 맞춰줘야 함
	- e.g. 'String'.hashCode 등
	- String은 메모리에서 상수이기 때문에 같은 문자는 같은 인스턴스이고 hashCode도 동일함

**필수 규칙**
- boolean 리턴, 절대 throw하면 안 됨
- Reflexive(재귀적): 모든 객체 o에 대해 o == o는 true여야 함
- Symmetric(대칭): 모든 객체 o1, o2에 대해 o1 == o2, o2 == o1은 모두 true 혹은 모두 false여야 함
- Transitive(전이): 모든 객체 o1, o2, o3에 대해 o1 == o2, o2 == o3가 true이면 o1 == 3도 true여야 함

### identical()
- 참조 비교
	- 같은 인스턴스인지 비교

## Comparable
- 정렬하기 위해 필수
- compareTo 메서드 구현 필요
	- but 클래스에 구현하면 정렬 규칙이 바뀔 경우 클래스 내부를 수정해야하기 때문에 Comparable을 implements하지 않고 외부에서 규칙 정하기


## 참고
- https://api.dart.dev/dart-core/Comparable-class.html
- https://api.dart.dev/dart-core/Object/operator_equals.html
- https://api.dart.dev/dart-core/identical.html