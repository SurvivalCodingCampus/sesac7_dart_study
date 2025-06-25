## File Control(파일 조작)
---
### 파일 조작의 기본 순서는 Open -> Read Or Write -> Close이다.
- Dart 파일 열기
	```dart
	void main() {
		// 파일 열기
		final File textFile = File('lib/files/text.txt'); // 인자값으로 경로 입력
	}
	```
- Dart 파일 쓰기
	- writeAsBytes()
		- List 형태의 Byte값을 파일에 쓴다.
	- writeAsBytesSync()
		- List 형태의 Byte값을 동기적로 파일에 쓴다.
	- writeAsString()
		- String값을 파일에 쓴다.
	- writeAsStringSync()
		- String 값을 동기적으로 파일에 쓴다.
	```dart
	void main() {
		final File textFile = File('lib/files/text.txt');
		textFile.writeAsStringSync('Content');
	}
	```
- Dart 파일 읽기
	- readAsBytes()
		- List 형태의 Byte값을 파일에서 읽는다.
	- readAsBytesSync()
		- List 형태의 Byte값을 동기적로 파일에서 읽는다.
	- readAsLine()
		- List 형태로 파일의 모든 줄을 읽는다.
	- readAsLineSync()
		- List 형태로 파일의 모든 줄을 동기적으로 읽는다.
	- readAsString()
		- String값을 파일에서 읽는다.
	- readAsStringSync()
		- String값을 파일에서 동기적으로 읽는다.
	```dart
	void main() {
		// 파일 열기
		final File textFile = File('lib/files/text.txt');
		final String textFileContent = textFile.readAsStringSync();
		print(textFileContent); // text.txt 내용 출력
	}
	```
- Dart의 경우 파일 닫기를 따로 하지 않아도 됨