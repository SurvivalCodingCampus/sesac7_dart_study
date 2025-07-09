# Dto, Mapper

데이터 소스를 모델로 정의하기 어려운 경우 - 동적 JSON (형태가 일정하지 않음)

```json
[
  {
    "id": 1,
    "type": "article",
    "title": "This is an article",
    "content": "This is the content of the article."
  },
  {
    "id": 2,
    "type": "image",
    "url": "https://example.com/image.jpg",
    "caption": "This is an image."
  },
  {
    "id": 3,
    "type": "video",
    "url": "https://example.com/video.mp4",
    "caption": "This is a video."
  }
]
```

- 이런 식으로 올바르지 않은 형태로 오는 경우가 있을 수 있는 일이다
- 레포지토리에서 터질 거다 (데이터 소스에서는 모든 형태로 받아 올 거라서)
- 데이터의 책임을 나누자

### JSON → DTO → (Mapper) → Model

## DTO (Data Transfer Object)

- 잘못된 데이터를 안전하게 받아서 치러할 곳이 필요하다
- DTO : 데이터 소스를 모델 클래스로 변환하는 과정에서 순수하게 클래스에 담기 위한 중간 전달 객체
- JSON → DTO → (Mapper) → Model
- 잘못된 데이터 소스 (Json)를 받더라도 안 터지게 하려는 클라이언트 개발자의 방어 수단

### DTO 예시

```json
{
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
```

```dart
class TodoDto {
  final num? userId;
  final num? id;
  final String? title;
  final bool? completed;

  TodoDto(this.userId,
      this.id,
      this.title,
      this.completed,);

  factory Todo.fromJson(Map<String, dynamic> json) {
    ...
  }

  Map<String, dynamic> toJson() {
    ...
  }
```

- 모든 필드가 Nullable 변수
- 직렬화, 역직렬화 제공

### 즉, Json을 그대로 안 터지게 받아들인다

## DTO 만드는 방법

1. 모든 필드를 Nullable로 하고 JsonSerializable 사용
2. Json을 받아들이기 편한 플러그인 사용 (Json to Dart)

## 모델 클래스 역할 수정

- 모든 필드는 non-nullable 상수
- ~~직렬화, 역직렬화~~
- == 재정의
- hashCode 재정의
- toString() 재정의
- copyWith() 제공

앱에서 필요한 형태(사용하기 쉬운)로 필드를 정의한다

데이터 소스의 모양과 무관하다

## 모델 클래스 생성을 편하게 - Freezed

- 모델 클래스 4종 세트 자동 생성 코드 제네레이터 기반의 패키지
- == 재정의, hashCode 재정의, toString() 재정의, copyWith() 재정의

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required String url,
    required String caption,
    required String title,
    required String content,
    required DateTime createdAt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
```

- 자동으로 직렬화/역직렬화도 만들어 준다
- 기존 방식은 현업에서 많이 쓰니 숙지해 두자
- 최신 방법 freezed 3는 알아는 두자 (사용법 다름)

## Mapper

### Dto를 모델 클래스로 변환

- 순수한 데이터 소스(DTO)를 원하는 모델 클래스로 변환하기 위한 로직은 별도의 Mapper를 통해 변환 함
- JSON → DTO → (Mapper) → Model

### Mapper 코드 작성 방법

- fromJson(), toJson() 도 Mapper 다
- extension 을 활용하여 기능을 분리하면 DTO와 분리되어 관리상 좋다

```dart
 extension DtoToPhotoMapper on PhotoDto {
  Photo toModel() {
    return Photo(
      id: (id is num) ? id.toInt() : -1,
      url: (url is String) ? url : 'null',
      caption: (caption is String) ? caption : 'null',
      title: (title is String) ? title : 'null',
      content: (content is String) ? content : 'null',
    );
  }
}
```

- 맵퍼는 Dto를 모델 클래스로 변환하는 유틸 메소드이다
- 확장함수 활용 추천
- Nullable을 non-Nullable로 변환하는 것이 핵심 ⇒ 왜? 내가 사용하기 편하기 때문이다
- Dto 전체를 변환하는 것이 아니다. **필요한 부분**만 변환하는 것이다

### Mapper 작성시 extension을 선호하는 이유

- DTO는 자동으로 만들고 수정하지 않는다 (무지성, 다른 코드 개임 no, 실수 방지)

### 자동생성된 DTO와 model은 손대지 말자

- 직접 만드는 부분은 Mapper뿐이기 때문에 터지는 곳도 항상 Mapper 일 것이다

### DataSource가 DTO를 반환하는 예시

```dart
class MockPhotoDataSourceImpl implements PhotoDataSource {
  final http.Client _client;

  MockPhotoDataSourceImpl({http.Client? client})
      : _client = client ?? http.Client();

  @override
  Future<Response<List<PhotoDto?>>> getPhotoDtos() async {
    final response = await _client.get(
      Uri.parse(''),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((e) => PhotoDto.fromJson(e))
          .toList(),
    );
  }
}
```

### Repository에서 DTO를 Model로 변환하는 반환 예시

```dart
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    final response = await _dataSource.getPhotoDtos();

    return response.body
        .map((e) => e?.toModel() ?? PhotoDto().toModel())
        .toList();
  }
}
```

### DTO가 필요한 이유

결론: 서버가 잘못한 경우에 덤탱이를 쓰지 않기 위해서다 (상대를 못 믿을 때 사용한다)

- Model Class 는 non-nullable 값만 가지고 있도록 한다
- Json 데이터는 null 값을 포함할 수 있음 (문서에 명시되어 있지 않더라도…)
- Map -> Model Class 변환시 null 값 등의 예외를 사전에 걸러내기 용이함
- 불완전한 코드가 포함될 것 같다면 DTO를 도입하자
- Json 값에 예외가 없다면 반드시 DTO를 도입할 필요는 없다

## 정리

- 기존에 작성한 모델 클래스는 DTO 와 모델 클래스의 역할을 모두 가지는 클래스였다
- DTO 가 도입된다면 역할 분담이 가능하다
    - DTO : 데이터 소스 직렬화, 역직렬화
    - 모델 클래스 : DTO에서 필요한 내용만 활용하는 도메인 객체