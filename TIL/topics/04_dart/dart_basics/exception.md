# 예외처리
- 문법 에러(syntax error), 실행시 에러(runtime error), 논리 에러(logic error)

## 특정 예외를 캐치
- 메모리 부족, 파일을 찾을수 없음, 네트워크 통신 불가 등
- API에는 여러가지 예외적 상황을 표현하는 예외 클래스가 준비되어 있다
- 특정 예외: 예를들어 통신이 안될때 터지게 하는것이 아니라 예외처리를 통해 사용자에게 알려줘야 하기때문에 예상된 예외처리를 한다
- rethrow: 명시적으로 필요할때 쓰지만 Dart 에서는 자동적으로 상위 메서드로 올라와서 터지게 되어있다

```dart
try {
    // 에러가 날 것 같은 코드 작성
} catch (e) {
    // e : 에러의 정보를 담고 있는 객체
}
```

- finally 로 항상 해야하는 처리

```dart
try {
    // 에러가 날 것 같은 코드 작성
} on FormatException {
    // e : 에러의 정보를 담고 있는 객체
} finally {
    // 무조건 실행되는 코드
}
```

- 예외 클래스를 상속하여 오리지날 예외 클래스를 정의할 수 있다
```dart
class UnsupportedMusicFileException implements Exception {
  final String? _message;

  UnsupportedMusicFileException([this._message]);

  @override
  String toString() {
    if (_message == null) return 'UnsupportedMusicFileException';
    return 'UnsupportedMusicFileException: $_message';
  }
}
```


## 파일 조작
- 프로세스가 시스템(프로그램) 하나라고 보면 된다
- 스레드: 작업 흐름, 프로그램 실행의 최소 단위
- 프로세스가 있다는 것은 최소 하나의 스레드가 있다는 것
- 다트는 싱글 스레드
