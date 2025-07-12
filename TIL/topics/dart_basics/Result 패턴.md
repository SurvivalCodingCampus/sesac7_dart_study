---

---
---
### 런터임 오류뿐만 아니라 비즈니스 로직의 잘못된 결과 반환에 대해서도 실패 처리를 해줘야한다.
- sealed class를 활용한 result 패턴
	```dart
	// freezed 없이 구현
	sealed class Result<T, E> {
		factory Result.success(T data) = Success;
		factory Result.error(E error) = Error;
	}

	class Success<T, E> implements Result<T, E> {
		final T data;
		
		Success(this.data);
	}

	class Error<T, E> implements Result<T, E> {
		final E error;

		Error(this.error);
	}

	// result.dart
	// freezed를 사용하여 구현
	
	part 'result.freezed.dart';
	
	@freezed
	sealed class Result<T, E> with _$Result<T, E> {
		const factory Result.success(T data) = Success;
		const factory Result.error(E error) = Error;
	}
	```
	- 타입을 봉인하는 효과를 가진다.(Enum과 비슷함)
	- 다른 객체의 참조를 가질 수 있다.
	- Switch문과 함께하면 강제성이 생겨서 모든 타입을 case로 넣어야해서 모든 타입에 대한 대응 가능
	- 성공과 실패의 제네릭 타입을 2개를 받아서 실패 타입은 Exception을 넣거나 Enum을 사용하여 에러 핸들링하는 것이 좋다.
- Result 패턴의 장점 
	- 타입 안정성이 향상되어 nullable하지 않게 할 수 있다.
	- 메서드 시그니처만 봐도 한눈에 어떤 타입의 결과가 전달되는지 확인 가능
	- try-catch 남용을 방지할 수 있다.
	- 비즈니스 로직과 에러처리 로직의 분리가 가능하다.
	- 테스트 용이성