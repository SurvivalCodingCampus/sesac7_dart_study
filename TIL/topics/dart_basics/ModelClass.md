## ModelClass
---
### 데이터 소스를 앱에서 필요한 형태로 변환한 데이터를 담는 클래스이며 별도의 기능을 가지지 않고 속성에 대한 데이터를 조회할 수 있다.
- 비슷하게 불리는 용어: 도메인 모델, Entity, DTO, POJO, VO, 데이터 클래스
- 모델링 방법
	- DDD(Domain Driven Design)
	- ORM(Object-relational mapping)
- 불변 객체
	- Dart의 경우 생성자로 받는 인자의 필드 값이 모두 final 이면 const  생성자 생성 가능
		```dart
			class Person {
				final String name;
				final int age;
				const Person({required this.naem, required this.age});
			}
		```
- 값 변경을 위해서 copyWith()를 제공
	- 불변 객체의 필드 값을 수정한 객체 복사를 위해 copyWith 메서드를 만든다.
		```dart
		class Person {
			final String name;
			final int age;
			...
			Person copyWith({String? name, int? age}) {
				return Person(name: name ?? this.name, age: age ?? this. age);
			}
		}
		```
- == Operator 재정의
	- 각 필드 값을 비교하여 내용이 같은 경우 같다고 판별하기 위함
	```dart
		class Person {
			final String name;
			final int age;
			...
			@override
			bool operator ==(Object other) => identical(this, other) ||
				other is Person && 
				runtimeType == other.runtimeType &&
				name == other.name &&
				age == other.age;
		}
	```
- hashCode 재정의
	- 각 필드 값의 hashCode를 조합하여 객체의 hashCode를 정의해서 같다고 판별하기 위함
	```dart
		class Person {
			final String name;
			final int age;
			...
			@override
			int get hashCode => Object.hash(name, age);
		}
	```
- toString() 재정의
	- 필요시 재정의 해서 디버깅할때 보기편함
- 직렬화와 역직렬화도 필요시 만들어 준다.
	- Ex) toJson, fromJson