## Exception(예외)
---
### 예외는 예상할 수 있는 문제를 대응하는 방법이며, 사전에 발생할 예외가 보이는 부분은 예외처리가 되도록 할 필요가 있다.

- 타당성 검사를 통해 예외처리를 한다.
- 예외의 종류
	- synyax error
		- **원인**: 코드의 형식적 오류
		- **발견** 시점: 컴파일 시점에 에러로 표출
		- **해결** 방법: 컴파일러의 에러 내용을 보고 수정
	- runtime error
		- **원인**: 실행 중 예상하지 못한 부분에서 발생하며 동작이 중지된다.
		- **발견** 시점: runtime 시점에 코드 수행 중 강제 종료된다.
		- **해결 방법**: 에러 분석
	- logic error
		- **원인**: 사용되는 논리 로직에 오류가 있음
		- 발견 시점: runtime 시 해당 로직이 실행될 때 예상하지 못한 결과 값이 나옴
		- **해결 방법**: 논리 로직을 분석하여 로직 수정 필요
- try-catch문을 사용하여 예외 처리 대응
	```dart
	void main() {
		try {
			final List<int> numbers = [0, 1, 2, 3, 4];
			numbers[100]; // index 초과
		} catch (e) {
			print('인덱스 조회 실패');
		}
	}
	```
- try-on을 사용하여 특정 Exception만 예외 처리 대응
	```dart
	void main() {
		try {
			final List<int> numbers = [0, 1, 2, 3, 4];
			numbers[100]; // index 초과
		} on RangeError {
			print('인덱스 조회 실패');
		}
	}
	```
- finally를 사용하여 try 혹은 catch의 스코프를 실행해도 마지막에 무조건 호출되도록 처리
	```dart
	void main() {
		try {
			final List<int> numbers = [0, 1, 2, 3, 4];
			numbers[100]; // index 초과
		} catch (e) {
			print('인덱스 조회 실패');
		} finally {
			print('인덱스 조회 작업 종료');
		}
	}
	```