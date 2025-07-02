## Serialization(직렬화)
- 데이터를 다른 컴퓨터 환경에 저장 혹은 네트워크 전송하고 나중에 재구성할 수 있는 포맷으로 변환하는 과정

### deserialization(역직렬화)
- 데이터를 추출하는 일

```dart
class Employee {
  final String name;
  final int age;

  Employee({
    required this.name,
    required this.age,
  });

  Employee.fromJson(Map<String, dynamic> json) // deserialization
    : name = json['name'],
      age = json['age'];

  Map<String, dynamic> toJson() { // serialization
    return {"name": name, "age": age};
  }
}
```

#### 데이터가 없을 경우 대비
- nullable로 처리하거나 기본값 사용
- 백엔드와의 규칙 중요
- 기본값 사용하는 것이 데이터 사용하기는 편함

#### 데이터의 타입이 엉망일 경우
- dynamic으로 받은 후 나중에 처리 가능


## 참고
- [wikipedia - 직렬화](https://ko.wikipedia.org/wiki/%EC%A7%81%EB%A0%AC%ED%99%94)