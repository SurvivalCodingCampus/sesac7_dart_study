## Generics(제네릭)
---
### 제네릭은 클래스 내부에서 사용할 데이터 타입을 외부에서 지정하는 기법이다.
- 타입을 생성할 때 받기 때문에 타입 세이프티한 코딩이 가능하다.
- 클래스명 옆에 '<>'키워드로 표시
	```dart
	class Box<E> {
		E product;
		Box({required this.product});
	}
	```
- Keywod
	- E: element의 약자
	- K: key의 약자
	- V: value의 약자
- Dart의 제네릭에는 Primitive Type 사용 가능
	- 다른 언어의 Primitive Type과 달리 Dart는 int, String 등 참조하는 클래스이기 때문에 가능하다.
- 제네릭을 사용하는 클래스를 생성할 때 제네릭에 타입을 지정해주지 않으면 해당 제네릭 타입은 dynamic이 된다.
- 제약조건
	- extends Keyword를 사용하여 제네릭 타입에 제약조건을 걸 수 있다.
		```dart
		class Box<E extends TangibleAsset> { // interface도 extends를 사용
			E product;
			Box({required this.product});
		}
		```