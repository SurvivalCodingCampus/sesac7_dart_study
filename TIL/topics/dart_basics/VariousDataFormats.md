## VariousDataFormats(여러가지 데이터 형식)
---
### 다양한 가공된 데이터의 형식을 다룬다.
- CSV
	- ','를 사용하여 데이터를 나누는 형식
	- 엑셀에서 자주 사용되고 String을 사용하여 Split하여 데이터 가공 후 사용한다.
		```dart
		void main() {
			String str = "사과,포도,바나나";
			List<String> splitStr = str.split(',');
		}
		```
-  Properties
	- key, value 형식의 쌍으로 읽고 쓰기가 가능하다.
	- Ex)
		```
		personName=홍길동
		personAge=28
		```
- xml
	- 확장된 마크업 랭귀지
	- <> 태그를 활용한 기술 방식
	- 포함관계를 기술할 수 있음
	- xml을 파싱하기 위해서는 별도의 Parser를 만들어야해서 어렵다.
	- Ex)
		```
		<note>
			<title>구글</title>
			<content>구굴은 구글이다.</content>
		</note>
		```
- Json
	- 네트워크 통신에서 가장 많이 사용된다.
	- xml에 비해 용량이 작다.
	- []로 리스트를 표현하고 {}로는 객체를 표현한다.
	- key / value의 형식
	- Dart의 Map과 동일하게 생겼다.
	- Ex)
		```
		{
			"이름": "홍길동",
			"나이": 25,
			"성별": "여",
			"주소": "서울특별시 양천구 목동",
			"특기": ["농구", "도술"],
			"가족관계": {"#": 2, "아버지": "홍판서", "어머니": "춘섬"},
			"회사": "경기 수원시 팔달구 우만동"
		}
		```


---
### Serialization(직렬화)
데이터 구조나 객체 상태를 저장하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정이고
클래스 내부의 필드에 다른 클래스가 있으면 해당 클래스도 직렬화 처리를 해야한다.
주로 Json 형식으로 서버와 통신하기 때문에 Json 직렬화를 기본으로 한다.
- 직렬화: 객체를 Json형식으로 변환
	- Dart에서 직접 직렬화 하기
		```dart
		class Person {
			final String name;
			final int age;

			Person({required this.name, required this.age});
			...
			// 직렬화 Dart의 맵과 동일한 형태이기 때문에 map으로 만듬
			Map<String, dynamic> toJson() 
				=> {'name': this.name, 'age': this.age};
		}
		```
	- jsonEncode를 사용하여 Json String 형태로 직렬화
		```dart
		class Person {
			final String name;
			final int age;

			Person({required this.name, required this.age});
			...
			// 직렬화 Dart의 맵과 동일한 형태이기 때문에 map으로 만듬
			Map<String, dynamic> toJson() 
				=> {'name': this.name, 'age': this.age};
		}
		void main() {
			final Person person = Person('홍길동', 25);
			jsonEncode(person.toJson()); // Map형태의 객체를 String으로 변환
		}
		```
- 역직렬화: Json형식을 객체로 변환
	- Dar에서 직접 역직렬화 하기
		```dart
		class Person {
			final String name;
			final int age;

			Person({required this.name, required this.age});
			...
			// 역직렬화 Dart의 맵과 동일한 형태이기 때문에 map으로 가공된 jsone데이터로 초기화
			Person.fromJson(Map<String, dynamic> json)
				: this.name = json['name'],
				  this.age = json['age'];
		}
		```
	- jsonDecode를 사용하여 Json String을 Map 형태로 역직렬화
		```dart
		class Person {
			final String name;
			final int age;

			Person({required this.name, required this.age});
			...
			// 직렬화 Dart의 맵과 동일한 형태이기 때문에 map으로 만듬
			Map<String, dynamic> toJson() 
				=> {'name': this.name, 'age': this.age};
			String getJsonString() => jsonEncode(toJson()); // String으로 받음
		}
		void main() {
			final Person person = Person('홍길동', 25);
			jsonEncode(person.getJsonString()); // JsonString을 Map으로 변환
		}
		```