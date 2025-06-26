# 여러가지 데이터 형식

1. csv 데이터를 콤마로 나눈 형식
2. 프로퍼티 형식 Properties 클래스를 사용하여 key 와 value 로 의 쌍으로 읽고 쓰기가 가능
3. xml 형식 <>태그를 활용한 기술 방식, 포함관계를 기술할 수 있음
- DOM Parser 등을 통해 파서를 제작할 필요가 있음

4. JSON 형식
- 네트워크 통신에서 가장 많이 사용되고 있음
- XML에 비해 적은 용량
- []로 리스트, {}로 객체를 표현
- key: value 의 형태
- Dart의 Map<String, dynamic> 과 동일하게 생겼음

## 직렬화
- 데이터의 구조나 객체 상태를 저장하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정
- 객체를 파일의 형태 등으로 저장하거나 통신하기 쉬운 포맷으로 변환하는 과정을 의미
- 클래스 내부의 필드에 다른 클래스가 있다면 모두 직렬화 처리를 해줘야 함

- toJson() 으로 직렬화
```dart
class Address{
    final String address;

    Address.fromJson(Map<String, dynamic> json)
    : address = json['address'];

    Map<String, dynamic> toJson() {
        return {'address': address};
    }
}

class User {
    final String name;
    final String email;
    final Address address; // 다른 클래스가 있다면 다른 클래스 안에서도 직렬화 해야한다

    User({required this.name, required this.email, required this.address});

    // 역직렬화
    User.fromJson(Map<String, dynamic> json)
        : name = json['name'], // Map 에서 객체 접근시 List[0] 이런것과 같이 Map[key 값]으로 접근해서 사용한다
        email = json['email'],
        address = Address.fromJson(json['address']);

    // 직렬화
    Map<String, dynamic> toJson() {
        return {'name': name, 'email': email, 'address': address.toJson()};
    }
}
```
## 역직렬화

- String 형태의 JSON을 역직렬화 하여 객체로 변환
```dart
// 서버에서 받은 값 string
final String jsonString = '''{
  "name": "john",
  "email": "john@gmail.com",
  "address": {
    "address": "Seoul"
  }
}''';

// JsonString -> Map
final Map<String, dynamic> json = jsonDecode(jsonString); 

// { "name": "john", "email": "john@gmail.com", "address": { "address": "Seoul" } }

// Map -> 객체
final User user = User.fromJson(json);
// User(name: 'john', email: 'john@gmail.com', address: Address(address : 'Seoul'));
```

- 객체를 Json String 형태로 직렬화
```dart
final User user = User(name: '홍길동', email: 'aaa@bbb.com');

// 객체 -> Map(Json)
Map<String, dynamic> json = user.toJson();

// Map(Json) -> String
String jsonString = jsonEncode(json);
```

- JSON validator 활용하기

### Map<String, dynamic> 런타임에 터질 수 있음
- key 는 항상 String, value 는 어떤 타입이든 가능해야한다
- 타입 추론이 불안정하기 때문에
- dynamic 잘못된 타입 사용 시 런타임 오류
- json 구조가 예상과 다르면 key 가 없거나 타입이 다르면 에러 등
- 타입 검사가 컴파일 타임에 되지 않고 런타임에 발생

#### 해결방법
- 접근 전에 타입 검사
- 안전하게 try/catch 로 안전하게 처리
- 클래스에서 안전하게 타입 변환: fromJson() 생성자 패턴을 사용해서

```dart

// 예시
factory User.fromJson(Map<String, dynamic> json) {
  final userMap = json['user'] as Map<String, dynamic>? ?? {}; 
  // as Map<String, dynamic>? 해당 타입으로 변환해주고 nullable 도 허용
  // ?? null 이면 {} 빈값으로 대체
  return User(name: userMap['name'] ?? 'Unknown');
}


```