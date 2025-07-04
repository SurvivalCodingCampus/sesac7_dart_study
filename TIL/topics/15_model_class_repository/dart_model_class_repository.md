# Model Class,Repository 개념

const 생성자를 사용하면 컴파일 타임에 생성된 객체들을 재활용한다

```dart

User user1 = const User(name: 'name', age: 10);
User user2 = const User(name: 'name', age: 10);

print(identical(user1, user2)); true
```

## Model Class의 책임과 역할

- 모델 객체 클래스의 속성에 대한 데이터를 조회할 수 있는 클래스
- 일반적으로 별도의 기능을 가지지 않는 순수한 클래스로 작성
- 데이터 소스를 앱에서 필요한 형태로 변환한 데이터, 앱 개발을 편리하게 해 주는 역할

```dart
class User {
  final String name;
  final String email;

  User(this.name, this.email);
}
```

- View에 보여질 데이터를 담는 객체
- View == 눈에 보이는 부분
- 비슷한 용어들
- 도메인 모델
- Entity
- DTO
- POJO
- VO
- 데이터 클래스 (4종 세트 포함)

  - hashCode, toString(), copyWith(), == (equals)

### 모델링 방법

### DDD (Domain Driven Design)

- omain 의 정의
- 유사한 업무의 집합
- 특정 상황(주문, 결재, 로그인)이나 특정 객체(유저, 손님)가 중심이 될 수 있음
- 모델 클래스
- 도메인을 클래스로 작성한 것

### ORM (Object-relational mapping)

- **ORM 의 정의**
- 데이터 소스가 DB 인 경우 DB 와 모델간 상호 변환을 도와주는 기법
- ORM은 DB 를 활용할 경우에 따로 살펴봐도 됨
- 지금은 이런게 있네 하고 넘어가자

## 모델 클래스는 불변 객체이다

```dart
class User {
  'final'로불변이다

  final String name;
  final String email;

  User(this.name,this.email);
}
```

## Model Class

- 불변 객체
- 값 변경을 위해 copyWith() 제공
- ==, hashCode 재정의
- toString() 재정의
- (옵션) 직렬화, 역직렬화 제공

```dart
class Person {
  final String name;
  final int age;

  const Person(this.name, this.age);

  Person copyWith({String? name, int? age}) {
    return Person(name ?? this.name, age ?? this.age);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'], json['age']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}

```

## 직렬화를 편하게 - JsonSerialzable (Dart)

```dart
dependencies:
  json_annotation: ^4.9.0

dev_dependencies:
  json_serializable: ^6.9.5
  build_runner: ^2.5.4
```

- 3개의 라이브러리가 필요하다

```dart
dart run build_runnable build
```

- 이 명렬어를 통해서 모델의 직렬화를 편하게 할 수 있다 (.g,dart 파일 생성됨)

```dart
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
```

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) =>
    Album(
      userId: (json['userId'] is num) ? (json['userId'] as num).toInt() : 0,
      id: (json['id'] is num) ? (json['id'] as num).toInt() : 0,
      title: (json['title'] is String) ? json['title'] as String : '',
    );

Map<String, dynamic> _$AlbumToJson(Album instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
```

## Repository 패턴

- Repository 패턴은 소프트웨어 개발에서 데이터 저장소에 접근하는 객체를 추상화하고,

  데이터소스(DB, File 등)와의 통신을 담당하는 객체를 캡슐화하는 디자인 패턴이다

## **Repository 의 책임과 역할**

- **데이터 접근의 진입점**
- **데이터 접근에 대한 추상화 계층**
- 데이터 소스 은닉
- 비즈니스 로직과 데이터 소스 사이의 중재자
- 데이터 매핑, 변환 담당

## Repository 패턴의 이점

- 데이터 접근 추상화
- 데이터 소스 구현 세부사항 은닉
- 일관된 인터페이스 제공
- 유지보수성 향상
- 관심사 분리
- 코드 재사용성
- 테스트 용이성
- 데이터 소스 Mocking 가능
- 단위 테스트 작성 용이
- 확장성
- 새로운 데이터 소스 추가 용이
- 기존 코드 수정 최소화
- 인터페이스 기반 설계

## DataSource

### 데이터 소스는 데이터를 읽고 쓰는 구체적인 메커니즘에 집중

```dart
abstract interface class AlbumDataSource {
  Future<List<Map<String, dynamic>>> getAll();
}
```

- 용도에 맞는 저장매체 특화 로직 구현
- File 을 조작하거나
- 서버와 통신하거나
- 메모리를 사용하거나
- (옵션) 데이터 형식 변환
- **저장 매체와 직접적인 소통**

## Repository 는 어떤 데이터를 제공할 것인가에 집중

- 데이터 소스를 숨기고
- 상위 계층에서 일관된 방법으로 데이터에 접근하는 방식을 제공
- **데이터를 비즈니스 로직에 전달**

```dart
abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
```

```dart
class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _dataSource;

  AlbumRepositoryImpl(this._dataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    try {
      final allAlbums = (await _dataSource.getAll())
          .map((e) => Album.fromJson(e))
          .toList();

      return (limit is int)
          ? (allAlbums.sublist(0, ((limit > 0) ? limit : 0)))
          : allAlbums;
    } catch (e) {
      return [];
    }
  }
}
```

- Repository 에서 도메인 특화 기능을 제공
- 도메인 ⇒ 비즈니스 문제 영역

## 도메인 특화 기능을 Repository 가 제공하는 경우의 장점

- 도메인 의도가 명확히 드러남
- 재사용 가능한 쿼리 로직
- 데이터 소스 구현과 분리된 비즈니스 요구사항 처리

## 주의할 점

- Repository는 어떤 데이터를 전달할지에 집중
- Repository는 **직접적인 데이터 조작이 아닌 필요한 데이터를 골라내는 일**을 할 것
- 저장 매체를 다루는 코드는 DataSource 에서 하도록
- 복잡한 비즈니스 로직은 더 상위 계층으로

## 정리

- DataSource는 직접적인 데이터 접근에 대한 방법을 작성
- Model 객체는 데이터 구조 정의 (순수 데이터만, 불변)
- Repository는 DataSource 사용 및 관리, 필요한 데이터 전달에 집중
- 단순하고 명확한 구조 유지

  ### 이렇게 하면 데이터 관리가 깔끔해짐

## 추천 폴더 구조

```dart
lib/
├── data_source/
│   ├── local/
│   │   ├── album_local_data_source_impl.dart
│   │   └── user_local_data_source_impl.dart
│   │
│   ├── remote/
│   │   ├── album_remote_data_source_impl.dart
│   │   └── user_remote_data_source_impl.dart
│   │
│   ├── album_data_source.dart      // 인터페이스
│   └── user_data_source.dart       // 인터페이스
│
├── repository/
│   ├── album_repository.dart       // 인터페이스
│   ├── album_repository_impl.dart  // 구현체
│   ├── user_repository.dart        // 인터페이스
│   └── user_repository_impl.dart   // 구현체
│
└── model/
    ├── album.dart
    └── user.dart
```