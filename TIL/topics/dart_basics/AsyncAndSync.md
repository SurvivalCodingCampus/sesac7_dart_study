## AsyncAndSync(비동기와 동기)
---
### 동기(Sync)
- 한 작업이 끝나면 다음 작업을 순차적으로 실행한다.
- **동기 프로그래밍**
	- 한 작업이 종료될 때까지 다른 작업을 할 수 없음
	- 코드의 실행 순서를 예측할 수 있다.
### 비동기(Async)
- 한 작업이 완료여부와 관련없이 별개로 실행할 수 있다.
- **비동기 프로그래밍**
	- 한 작업을 진행하는 동안 다른 작업을 할 수 있다.
	- 작업의 완료 순서를 예측할 수 없다.
	- I/O 작업, 네트워크 요청과 같은 시간이 오래걸리는 작업에 유용하다.

### 동시성(Concurrency)
- 여러 작업을 논리적으로 동시에 실행되는 것처럼 보이는 개념
- 시분할 방식으로 여러 스레드를 활용해 동시성 구현 가능
### 병렬성(Parallelism)
- 여러 작업이 물리적으로 동시에 실행되는 개념
- 멀티코어 환경에서 실제로 여러 스레드가 병렬로 실행될 수 있음
### Dart Async Programming
- **콜백**
	- 함수형 프로그래밍과 동일한 방식
	- 콜백 기준의 동기화 방식의 문제점
		- 코드의 깊이가 깊어져서 관리하기가 어려움
		- 콜백 지옥이 발생할 수 있음
		- 디버깅을 하기 어려움
		- 병렬처리가 어려움
	```dart
	void readData(void Function(String) onSuccess) {
		File file = File('path/text.txt');
		
		onSuccess(file.readAsStringAsync());
	}
	void main() {
		readData((String result) {
			print(result);
		});
	}
	```
- **Future**
	- **Future와 then 사용**
		- 동시에 여러가지 비동기 코드를 실행할 수 있다.
		```dart
		Future<String> readData() {
			File file = File('path/text.txt');
			
			return file.readAsString();
		}
		void main() {
			readData().then((data) => print(data));
		}
		```
		- 실행 순서나 완료의 예측이 어려운 단점이 있다.
	- **Future / async와 await 사용**
		- 비동기 코드를 순차적으로 실행하게 할 수 있다.
		- 디버깅이 쉽고 예측이 가능하다.
		- 비동기로 작업을 진행하기 때문에 성능은 떨어질 수 있다.
		```dart
		Future<String> readData() async {
			File file = File('path/text.txt');
			await Future.delayed(Duration(seconds: 1));
			return file.readAsString();
		}
		void main() async {
			String data = await readData();
			print(data); // 1초 후 결과 출력
		}
		```
	- **예외 처리**
		- then을 사용하여 체이닝 방식으로 처리가능하나 복잡하다.
		- try-catch를 사용하여 처리가능.
	- **병렬 처리**
		- Future.wait()을 사용하면 한번에 시작해서 마지막에 끝나는 작업까지 기다린다.
		```dart
		Future<String> readData(int seconds) async {
			File file = File('path/text.txt');
			await Future.delayed(Duration(seconds: seconds));
			return file.readAsString();
		}
		void main() async {
			List<Future<String>> datas = [readData(1), readData(2), readData(3)];
			
			print(await Future.wait(datas));
		}
		```