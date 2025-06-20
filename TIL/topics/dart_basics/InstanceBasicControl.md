## InstanceBasicControl(인스턴스 기본 조작)
---
- ### Dart의 모든 클래스는 암묵적으로 Object 클래스를 상속 받는다.
	- Object의 Method와 Property 사용가능
		- Override를 통한 재정의가 가능
		- toString()
			```dart
			class Person {
				String name;
				Person({required this.name});
				...
				@override
				String toString() {
					return '${name}입니다.';
				}
			}
			```
		- operator ==
			```dart
			class Person {
				String name;
				Person({required this.name});
				...
				@override
				bool operator ==(Object other) {
					return other is Person ? name == other.name : false;
				}
			}
			```
		- hashCode
			- 동일한 객체는 항상 같은 해시값을 같는다.
			```dart
			class Person {
				String name;
				Person({required this.name});
				...
				@override
				int get hashCode => name.hashCode;
			}
			```

- ### 동등성 비교
	- operator == 혹은 hashCode를 사용하여 동등성 규칙을 재정의 할 수 있다.
	- Collection의 동등성 비교
		- List의 경우 operator == 를 사용하여 동등성 비교를 한다.
			```dart
			class Person {
				String name;
				Person({required this.name});
				...
				@override
				bool operator ==(Object other) {
					return other is Person ? name == other.name : false;
				}
			}
			void main() {
				Person person1 = Person(name: '사람이름');
				Person person2 = Person(name: '사람이름');
				List<Person> people = [];

				people.add(person1);
				people.remove(person2);

				// 동등성 비교 규칙을 재정의해서 사람이름이 같기때문에 0으로 나옴
				print(people.length); 
			}
			```
		- Set, Map의 경우 hashCode를 사용하여 동등성 비교를 한다.
			```dart
			class Person {
				String name;
				Person({required this.name});
				...
				@override
				int get hashCode => name.hashCode;
			}
			void main() {
				Person person1 = Person(name: '사람이름');
				Person person2 = Person(name: '사람이름');
				Set<Person> peopleSet = {};

				peopleSet.add(person1);
				peopleSet.remove(person2);

				// 동등성 비교 규칙을 재정의해서 사람이름의 hashCode가 같기 때문에 0
				print(peopleSet.length); // 0

				Map<String, Person> peopleMap = {};

				peopleMap['Key'] = person1;

				// 동등성 비교 규칙을 재정의해서 사람이름의 hashCode가 같기 때문에 true
				print(peopleMap.containsValue(person2)); // true
			}
			```
	- identicalkeyword
		- 실제 객체 참조주소 비교한다.

- ### Sort
	- List의 sort() 메서드는 해당 리스트의 순서를 정렬한다.
	- Dart의 sort() 메서드는 원본 데이터를 정렬 시킨다.
		```dart
		void main() {
			List<int> numbers = [4, 2, 1, 3, 5, 6];
			numbers.sort();
			print(numbers.sort()); // [1, 2, 3, 4, 5, 6]
			print(numbers); // [1, 2, 3, 4, 5, 6]
		}
		```
	- 원본 데이터를 재정렬하는 문제를 막기위해 Collection Library를 사용한다.
		- sorted() 사용
			```dart
			void main() {
				List<int> numbers = [4, 2, 1, 3, 5, 6];
				List<int> sortedNumbers = numbers.sorted(
					(a, b) => a.compareTo(b) // comparable
				);
				print(numbers); // [4, 2, 1, 3, 5, 6]
				print(sortedNumbers); // [1, 2, 3, 4, 5, 6]
			}
			```
	- 미리 정렬 규칙을 정하기 위해서 Comparable Interface를 사용한다.
		```dart
		class Person implements Comparable<Person> {
			String name;
			Person({required this.name});

			@override  
			int compareTo(Person other) => other.name.compareTo(name);
		}
		void main() {
			Person person1 = Person(name: '김길동');
			Person person2 = Person(name: '이길동');
			Person person3 = Person(name: '정길동');
			List<Person> people = [person1, person2, person3];

			people.sorted(); // 미리 implements해서 규칙을 정했기 때문에 파라미터 생략가능
		}
		```

- ### 인스턴스 복사
	- 인스턴스를 복사하기 위해서 해당 객체에 복사 메서드를 만들어준다. 
		```dart
		class Person {
			final String name;
			final int age;

			Person({required this.name, required this.age});
			...
			Person copyWith({ // 복사 메서드
				String? name,
				int? age	
			}) {
				return Person(
					name: name ?? this.name,
					age: age ?? this.age
				);
			}
		}
		```
	- 얕은 복사
		- 내가 만든 Class의 인스턴스를 그대로 복사하면 얕은 복사가 된다. (int, double, String은 같은 값이면 같은 주소를 참조한다)
			```dart
			class Wand {
				int damage;
				Wand({this.damage});
			}
			class Wizard {
				String name;
				int hp;
				Wand wand;

				Wizard({this.name, this.hp, this.wand});							
				// shallowCopy시 생성된 wand 인스턴스를 넣어줘서 같은 주소를 참조하는 문제 발생
				// wand 인스턴스 속성 변경시 동시에 바뀌는 문제 발생
				Wizard shallowCopy() => Wizard(name: name, hp: hp, wand: wand);
			}
			```
	- 깊은 복사
		- 객체내의 모든 속성에 카피를 할 수 있게 메서드를 만들어서 카피된 값으로 복사해줘야 깊은 복사가 된다.
			```dart
			class Wand {
				int damage;
				Wand({this.damage});

				Wand deepCopy() => Wand(damage: damage);
			}
			class Wizard {
				String name;
				int hp;
				Wand wand;

				Wizard({this.name, this.hp, this.wand});							
				// wand 인스턴스 복사한 새로운 인스턴스를 넣어줘서 서로 다른 주소를 참조한다.
				Wizard deepCopy() => Wizard(name: name, hp: hp, wand: wand.deepCopy());
			}
			```