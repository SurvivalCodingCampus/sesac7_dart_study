## String
- String은 불변 객체
- 같은 String은 인스턴스 하나 재활용함
	- 컴파일 타임과 런타임 다름
		- 같은 String도 다른 인스턴스 존재 가능
		- 컴파일 타임 상수는 별도 메모리 공간 존재
- 인스턴스 생성을 계속하기 때문에 비용이 비쌈
- interpolation(${})은 Dart가 객체의 toString()을 호출함
- == 으로 비교 시 같은 code unit sequence인지 비교

## StringBuffer
- String 연결을 효율적으로 하기 위한 클래스
- String은 인스턴스 생성 연산이 많을 경우 확 느려짐
```dart
void main() {
  var name = '';
  var stopwatch = Stopwatch();
  stopwatch.start();
  for (var i = 0; i < 100000; i++) { // 십만
    name += 'a';
  }
  stopwatch.stop();
  print(stopwatch.elapsed); // 0:00:00.231139
  name = '';
  stopwatch
    ..reset()
    ..start();
  for (var i = 0; i < 1000000; i++) { // 백만
    name += 'a';
  }
  print(stopwatch.elapsed); // 0:01:31.049186
}
```

- StringBuffer는 인스턴스 하나를 수정하기 때문에 빠름
```dart
void main() {
  var name = StringBuffer('name');
  var stopwatch = Stopwatch();

  stopwatch.start();
  for (var i = 0; i < 1000000; i++) { // 백만
    name.write('a');
  }
  name.toString();
  print(stopwatch.elapsed); // 0:00:00.028035
}
```


## 참고
- https://api.flutter.dev/flutter/dart-core/String-class.html
- https://dart.dev/language/built-in-types#strings
- https://api.dart.dev/dart-core/StringBuffer-class.html
