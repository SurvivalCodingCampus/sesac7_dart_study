# 여러가지 데이터 형식

### CSV, XML, JSON

## JSON

- 컴퓨터도 선호하고 사람도 선호한다 (가장 유행하는 타입)

## 컴퓨터 세계에서의 직렬화의 의미

- 데이터 구조나 객체 상태를 저장하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정이다
- 객체를 파일의 형태 등으로 저장하거나, 통신하기 쉬운 포맷으로 변화하는 과정을 의미한다
- 클래스 내부의 필드에 다른 클래스가 있다면 **모두 직렬화 처리**를 해 줘야 함

## 직렬화 (Serialization)

- 주로 서버와 Json으로 통신을 할 것이기 때문에 Json 직렬화를 기본으로 한다
- 직렬화 : 클래스 (객체) → Json
- 역직렬화 : Json → 클래스 (객체)

### String 형태의 JSON을 역직렬화를 하여 객체로 변환하는 과정

```dart
{
	"naem": "John Smith",
	"email", "John@example.com"
}

// 서버에서 받은 값
final String jsonString = ```{
	"naem": "John Smith",
	"email", "John@example.com"
}```;

// JsonString -> Map
final Map<String, dynamic> json1 = jsonDecode(jsonString);

// Map -> 객체
final User user = User.formJson(json);

반대로
// 객체 -> Map(Json)
Map<String, dynamic> json2 = user.toJson();

// Map(Json) -> String
String jsonString = jsonEncode(json);
```

- jsonDecode() : Json String 을 Map으로 변환해 주는 기본 함수
- jsonEncode() : Map(Json) 을 Json String 으로 변환 (서버에 보내기 위해)