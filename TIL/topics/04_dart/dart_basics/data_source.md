# 데이터 소스

: 데이터를 가저오고 정리해서 보여주기 좋게 만드는 역할
- 외부 데이터 저장소와 통신
- Raw 데이터 수신 및 처리
- CRUD 작업 수행

## factory 생성자 사용

1. facrtory 붙어있을때: factory는 미리 조작해서 런타임에 조작해서 리턴 할 수 있음
2. 안붙어있을때: 컴파일 타임에 확정되고 런타임에 조작할 수 없음

### 다양한 형태의 데이터를 변환해서 객체로 변환하면 앱에서 쉽게 사용할 수 있다

## DataSource 상황에 따라 이름 짓기
- 접두어로 저장소 유형 표시, 저장소 위치 기준
- 구현 기술이 명확할 경우 해당 이름 사용, 기술 스택 기준

```dart
//  저장소 유형별 구현체
class LocalUserDataSource implements UserDataSource // 로컬 저장소
class RemoteUserDataSource implements UserDataSource // 원격 저장소

// 구체적인 기술 스택별 구현체
class RoomUserDataSource implements UserDataSource // Room DB

// Impl 접미사를 사용하는 이름, 구현체임을 명확히 표시
class AuthDataSourceImpl implements AuthDataSource

    @override
    Future<void> login(String email, String password) {
        // 인증처리
    }

```

## 구현체와 인터페이스의 구분
- 인터페이스(약속만 정의), 구현체(실제 내용 정의)

## 의존성을 끊기 위해서 repository 사용
