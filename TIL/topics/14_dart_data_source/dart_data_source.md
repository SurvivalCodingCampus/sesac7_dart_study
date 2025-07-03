# DataSource

- 앱이 사용하는 원천 데이터
    - 마치 요리를 할 때 재료
    - 다양한 형태 : 파일, 텍스트, JSON, DB 등
- 앱은 단독으로 데이터를 만들어내지 않는다
- 대부분의 앱은 외부에서 데이터를 받아와서 화면에 보여준다

### 앱 = 비빔밥, DataSource = 비빔밥 재료

- 데이터를 가져와서 손질하고 요리(가공)해야 사용자에게 보여줄 수 있다
- 재료도 흙 묻은 재료의 손질이 필요하듯 데이터도 가공이 필요하다

## DataSource의 역할

- 외부 데이터 저장소와 통신
- Raw 데이터 수신 및 처리
- CRUD 작업 수행

⇒ 즉, 데이터를 “가져오고”, “정리해서”, “보여주기 좋게 만드는” 역할을 한다

- 직렬화

### DataSource 종류

- Text (.txt 등), File (로컬 파일), JSON (웹 API에서 자주 사용), XML, CSV (엑셀 같은 형식)
- RDBMS (MySQL, PostgreSQL 등 관계형 DB)
- NoSQL (MongoDB, Firebase Firestore 등)
- 등등

## 흐름도

- DB → Raw 데이터 추출 → JSON 파싱 → 앱에서 사용
- DB (파일) → JSON → Dart 객체 → UI

## Factory 생성자

- 새 인스턴스를 생성하는게 아닌 만든 인스턴스를 재활용한다 뉘앙스로 공식에 적혀있음
- 공식은 특정한 경우에만 사용하는 식으로 알려주지만 그런 거 아님
- 런타임에 조작 가능한 인스턴스를 만드는 것 (간단하게 보면)
- 런타임에 인스턴스를 찍어낼 때 조작이 들어가는 것이다
- Singleton 패턴이 될 수는 있지만 반드시는 아니다
- Factory 키워드처럼 인스턴스를 찍어낸다 (하나일 수도 여러 개일 수도)
- 언어적으로 Factory 와 Singleton은 서로 반대되는 개념이다
- Factory를 사용하면 { } 로 가능해진다 (initializtion 사용 안 해도 됨)

```dart
Person.fronJson(Map<String, dynamic> json) : name = json['name'];

{ } 사용 가능, 한 줄에 조건을 욱여넣을 필요가 없어짐
Factory Person.fronJson(Map<String, dynamic> json) {
    return Person(json['name']);
}

기본 생성자에 이름을 지정한 것이다 ( _ 붙이면 외부에서 접근 못함)
Person._생성자명(this.name);
```

## DataSource는 인터페이스로

- 구현할 때는 인터페이스와 구현체를 구분하기 위해 Impl 접미사를 사용하자

```dart
abstract interface class AuthDataSource {}

class AuthDataSourceImpl implements AuthDataSource {}
```

- 구현체임을 명확히 표시
- 인터페이스와 구현체 구분 용이
- 많은 기업/프로젝트에서 채택하는 관례

## 정리

- DataSource는 앱이 데이터를 가져오는 출발점이다
- 다양한 형태(JSON, CSV, DB 등)가 존재한다
- 데이터를 받아와서 객체로 변환하면 앱에서 쉽게 사용 가능하다