# Result 패턴

서버에 데이터 요청시 예상되는 상황

- 성공 (Success)
- 실패 (Error) : 실패의 종류가 하나가 아님
    - 네트워크 문제 : 연결이 안 되어 있음, 네트워크 불안정으로 타임아웃 발생
    - 논리적으로 잘못된 값
    - 그냥 내가 판단했을 때 에러인 경우
    - 등등

### 에러처리의 기본 try - catch

- 기본적으로 예외는 try - catch 를 활용하여 처리 한다.
- 런타임 에러 뿐만 아니라 논리적인 오류나 예외 상황에 대한 처리를 하기에는 부족하다
- Result 패턴은 여러가지 성공, 실패를 처리할 때 유용한 패턴이다

### 성공과 실패 중 하나를 리턴한는 Result 클래스 예시

- Result 클래스는 성공 시 데이터를, 실패 시 에러 정보(예: Exception, String)를 담는 객체를 정의한다
- sealed 클래스는 타입 봉인 효과를 가진다 (enum 하고 비슷한 효과 + 다른 객체의 참조를 가질 수 있다)

```dart
sealed class Result<T> {
  factory Result.success(T data) = Success;

  factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  Success(this.data);
}

class Error<T> implements Result<T> {
  final String message;

  Error(this.message);
}
```

### 결과를 Result로 감싸서 반환하기

```dart
class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, NetworkError>> getUser(int id) async {
    try {
      final user = (await _dataSource.getUsers()).body
          .where((e) => e.id == id)
          .map((e) => e.toModel())
          .toList()
          .first;
      return Result.success(user);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } on FormatException {
      return Result.error(NetworkError.parseError);
    } catch (e) {
      return Result.error(NetworkError.notFound);
    }
  }
}
```

- **여러가지 에러를 Result 형식으로 포장해서 내보낼 수 있다**
- Result로 감싸서 2가지 이상의 에러를 리턴가능

## Result 패턴 사용시 효과

- enum 과 동일하게 switch 문과 조합하여 모든 처리를 강제할 수 있다
- 성공과 실패를 처리할 있다

```dart

final result = await
repository.getUser(1);
switch (result) {
  case Success<User, NetworkError>():
    final user = result.data;
    expect(user.id, 1);
    expect(user.name, 'Kim');
  case Error<User, NetworkError>():
    switch (result.error) {
      case NetworkError.requestTimeout:
        expect(result.error, NetworkError.requestTimeout);
      case NetworkError.unauthorized:
        expect(result.error, NetworkError.unauthorized);
      case NetworkError.notFound:
        expect(result.error, NetworkError.notFound);
      case NetworkError.serverError:
        expect(result.error, NetworkError.serverError);
      case NetworkError.parseError:
        expect(result.error, NetworkError.parseError);
      default:
        expect(result.error, NetworkError.unknown);
    }
}
```

## freezed 를 활용한 Result 클래스 ver. 2

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T data) = Success;

  const factory Result.error(E error) = Error;
}

```

- 두 코드는 동일한 코드임
- 위에 코드는 원하는 에러 타입 정의도 가능한 버전

### Result 클래스 ver. 1

```dart
sealed class Result<T> {
  factory Result.success(T data) = Success;

  factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  Success(this.data);
}

class Error<T> implements Result<T> {
  final String message;

  Error(this.message);
}
```

### 사용 예시

```dart
abstract interface class UserRepository {
  Future<Result<User, NetworkError>> getUser(int id);

  Future<Result<List<User>, NetworkError>> getUsers();

  Future<Result<String, NetworkError>> createUser(String name);
}
```

### 에러 타입 정의 가능

```dart
enum NetworkError {
  requestTimeout,
  unauthorized,
  notFound,
  serverError,
  parseError,
  unknown,
}
```

- ‘결과를 Result로 감싸서 반환하기’ 보면 2가지 이상의 에러를 리턴 가능
- ‘Result 패턴 사용시 효과’ 보면 최종 결과 처리 부분에서 switch로 처리를 강제할 수 있음

## 추천 디렉터리 구조

- core/result.dart

## Result 패턴 사용시 장점 1

- 타입 안전성 향상

```dart
// Result 패턴 사용 전
User? registerUser(String email, String password) {
  if (!isValidEmail(email)) return null; // 왜 실패했는지 알 수 없음
}

// Result 패턴 사용 후
Result<User, RegistrationError> registerUser(String email, String password) {
  if (!isValidEmail(email)) {
    return const Result.error(error: RegistrationError.invalidEmail());
  }
}
```

## Result 패턴 사용시 장점 2

- 에러 처리 강제성 (컴파일러가 모든 케이스 처리를 강제함)

```dart
switch (usersResult) {
    case Success<List<User>>():
        print('성공: ${usersResult.data.toString()}');
    case Error<List<User>>():
        print('실패 : ${usersResult.message}');
}
```

## Result 패턴 사용시 장점 3

- 에러 타입의 명확한 문서화

```dart
// 메서드 시그니처만 봐도 어떤 에러가 발생할 수 있는지 명확함
Future<Result<User, RegistrationError>> registerUser({
  required String email,
  required String password,
});
```

## Result 패턴 사용시 장점 4

- try - catch 남용 방지

```dart
// try-catch 사용
try {
    final user = await registerUser(email, password);
} catch (e) {
    if (e is InvalidEmailError) {
        // 처리
    } else if (e is WeakPasswordError) {
        // 처리
    }
}
```

## Result 패턴 사용시 장점 5

- 비즈니스 로직과 에러 처리 분리

```dart
// 비즈니스 로직
Result<User, RegistrationError> registerUser
(...) {
// 순수한 비즈니스 로직
}

// 에러 처리
void handleRegistration(Result<User, RegistrationError> result) {
// UI나 다른 계층에서 에러 처리
}
```

## Result 패턴 사용시 장점 6

- Nullable 타입 사용 감소

```dart
// 옵셔널 사용
User? user = await registerUser();
if (user != null) {
    // null 체크 필요
}

// Result 패턴
Result<User, RegistrationError> result = await registerUser();
// null 체크 불필요
```

## Result 패턴 사용시 장점 7

- 테스트 용이성

```dart
test('이메일이 유효하지 않으면 에러를 반환한다', () {
    final result = registerUser(email: 'invalid-email', password: 'password');

    expect(
        result,
        Result<User, RegistrationError>.error(
            error: RegistrationError.invalidEmail(),
        ),
    );
});
```

## Result 패턴 사용시 장점 8

- 패턴 매칭을 통한 가독성 향상

```dart
switch (result) {
    case Success(data: final user):
        handleSuccess(user);
    case Error(error: final error):
        switch (error) {
            case InvalidEmailError():
                handleInvalidEmail();
            case WeakPasswordError():
                handleWeakPassword();
            case NetworkError():
                handleNetworkError();
        }
}
```

## 정리

- enum 은 클래스만큼 자유롭지 않다
    - equals, hashcode 재정의가 불가능하다
- sealed class 는 서브타입을 봉인한다.
- sealed class 는 패턴매칭을 활용하여 모든 서브타입에 대한 처리를 하기 용이하다
- Result 패턴은 여러가지 종류의 성공과 실패를 처리하기 용이한 패턴이다
- 앱의 규모에 맞는 Result 패턴을 사용하자
    - 소규모 ver 1 으로 충분
    - 중규모 이상 : ver 2