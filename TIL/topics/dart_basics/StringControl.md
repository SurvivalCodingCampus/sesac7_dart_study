## StringControl(문자열 조작)
---
### String을 다양한 방법으로 합치거나 잘라내고, 원하는 부분만 수정하는 등 할 수 있도록 기본 제공되는 함수들을 사용
- 문자열 결합
	- 문자열 + 문자열
		```dart
		void main() {
			print('Hello' + 'Dart'); // 'HelloDart'
		}
		```
	- StringBuffer
		- write() 메서드로 결합한 결과를 내부 메모리(버퍼)에 담아 두고 toString으로 결과를 얻는다.
			```dart
			final buffer = StringBuffer('Hello');

			buffer
				..write('World')
			void main() {
				print(buffer.toString()); // 'HelloWorld'
			}
			```
- String Interpolation(보간)
	- ${수식} 을 활요한다.
	```dart
	void main() {
		String hello = 'Hello';
	
		print('${hello}Dart'); // 'HelloDart'
		print('${3 + 2}'); // '5'
		print('${hello.toUpperCase()}'); // 'HELLO'
	}
	```
- 문자열 잘라내기
	- substring() 함수를 사용한다. 첫 번째 파라미터는 시작 인덱스, 두 번째는 시작 부터 몇 번째까지 범위
	```dart
	void main() {
		String hello = 'Hello';
	
		print(hello.substring(0, 2)); // 'He'
	}
	```
- 문자열 일부 치환
	- replaceAll() 함수를 사용한다. 첫 번째 파라미터는 변경할 문자, 두 번째는 변경될 문자
	```dart
	void main() {
		String hello = 'Hello';
	
		print(hello.replaceAll('ll', 'xx')); // 'Hexxo'
	}
	```
- 문자열 분리
	- split() 함수를 사용한다. 파라미터는 분리의 기준이 되는 문자
	```dart
	void main() {
		String numberStr = '1, 2, 3';
		List<String> splited = numberStr.split(',');

		splited.forEach((e) {
			print(e); // roop1: '1', roop2: '2', roop3: '3'
		});
	}
	```
- 문자열 대소문자 변경
	- 대문자의 경우 toUpperCase(), 소문자의 경우 toLowerCase() 함수를 사용한다.
	```dart
	void main() {
		String hello = 'Hello';
		print(hello.toLowerCase()); // 'hello'
		print(hello.toUpperCase()); // 'HELLO'
	}
	```
- 문자열 검색
	- indexOf() 함수를 사용한다. 파라미터는 검색이 될 문자
	```dart
	void main() {
		String hello = 'Hello';
		print(hello.indexOf('e')); // 1
	}
	```
	- contains() 함수를 사용한다. 파라미터로 포함되어 있는지 확인할 문자열을 넣음
	```dart
	void main() {
		String helloWorld = 'Hello World';
		print(helloWorld.contains('Hello')); // true
	}
	```
	- endsWith() 함수를 사용한다. 파라미터로 해당 문자열의 끝나는 문자열 체크할 문자열을 넣음
	```dart
	void main() {
		String helloWorld = 'Hello World';
		print(helloWorld.endsWith('World')); // true
	}
	```
	- indexOf() 함수를 사용한다. 파라미터로 문자열에서 몇 번째에 있는지 확인할 문자열을 넣음
	```dart
	void main() {
		String helloWorld = 'Hello World';
		print(helloWorld.indexOf('Hello')); // 0
	}
	```
	- lastIndexOf() 함수를 사용한다. 파라미터로 뒤에서 몇 번째에 있는지 확인할 문자열을 넣음
	```dart
	void main() {
		String helloWorld = 'Hello World';
		print(helloWorld.lastIndexOf('l')); // 3
	}
	```
- 문자열 내용 비교
	-  == 을 사용한다.
	```dart
	void main() {
		String hello1 = 'hello';
		String hello2 = 'HELLO';
		
		print(hello1 == hello2); // false
		print(hello1.toLowerCase() == hello2.toLowerCase()); // true
	}
	```
- 문자열 길이
	- length, isEmpty 프로퍼티를 사용한다.
	```dart
	void main() {
		String hello = 'Hello';
		
		print(hello.length); // 5 길이체크
		print(hello.isEmpty); // false 비어있는지 확인
	}
	```
- 문자열 변환
	- toLowerCase() 함수를 사용한다. 해당 함수는 모든 문자를 소문자로 변경
	```dart
	void main() {
		String hello = 'Hello';
		
		print(hello.toLowerCase()); // 'hello'
	}
	```
	- toUpperCase() 함수를 사용한다. 해당 함수는 모든 문자를 대문자로 변경
	```dart
	void main() {
		String hello = 'Hello';
		
		print(hello.toUpperCase()); // 'HELLO'
	}
	```
	- trim() 함수를 사용한다. 해당 함수는 문자열의 좌우 공백을 제거한다.
	```dart
	void main() {
		String hello = '   Hello  ';
		
		print(hello.trim()); // 'Hello'
	}
	```
	- replaceAll() 함수를 사용한다. 해당 함수의 첫 번째 파라미터 문자열을 두 번째 파라미터 문자열로 전부 교체한다.
	```dart
	void main() {
		String hello = 'HelloBello';
		
		print(hello.replaceAll('ll', 'xx')); // 'HexxoBexxo'
	}
	```