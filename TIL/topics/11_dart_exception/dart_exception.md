# 예외

- 문법 에러 (syntax error)
- 실행 시 에러 (runtime error)
- 논리 에러 (logic error)

## 예외 처리의 흐름

```dart
try {
  에러 날 것 같은 코드 작성
} catch (e) {
  e : 에러의 정보를 갖고 있는 객체
  throw Exception('에러가 발생');
}
```

### rethrow로 에러 처리를 미룰 수 있다

```dart
void main() {
  try {
    someError();
  } catch (e) {
    throw Exception('밑에서 올라온 예외');
  }
}

void someError() {
  try {
    에러 날 것 같은 코드 작성
  } catch (e) {
    rethrow;
  }
}
```

### Dart는 try-catch 없이 사용해도 되지만 명시적으로 보기 위해서 사용하자

- try-catch 없이 사용하면 자동으로 rethrow 해준다

### 특정 예외를 캐치 할 수 있다

- catch 대신 on으로 지정 가능하다

```dart
try {
  에러 날 것 같은 코드 작성
} on FormatException {
  print('FormatException이 발생했습니다');
}
```

### finally로 항상 해야하는 처리를 실행시킬 수 있다

```dart
try {
  에러 날 것 같은 코드 작성
} on FormatException {
  print('FormatException이 발생했습니다');
} finally {
  print('무조건 실행되는 코드');
}
```

### 오리지날 예외 클래스를 정의해서 사용 가능하다

```dart
class OriginalException implements Exception {
  final String? _message;

  OriginalException([this._message]);

  @override
  String toString() {
    if (_message == null) return 'OriginalException';
    return 'OriginalException: $_message';
  }
}
```
## 정리
### 에러
- syntax error, runtime error, logic error 의 3종류
- 예외처리를 할 때는 runtime error를 대처한다

### 예외의 종류
- API에는 여러가지 예외적 상황을 표현하는 예외 클래스가 준비되어 있다
- 예외 클래스를 상속하여 오리지날 예외 클래스를 정의할 수 있다

### 예외 처리
- try-catch 문을 사용하면 try 블록 내에 예외가 발생했을 때 catch 블록으로 처리가 옮겨진다
- finally 블록으로 나중에 꼭 해야하는 처리를 할 수 있다
- throw 문을 사용하면 임의로 예외를 발생시킬 수 있다