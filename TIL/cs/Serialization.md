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


## 참고
- [wikipedia - 직렬화](https://ko.wikipedia.org/wiki/%EC%A7%81%EB%A0%AC%ED%99%94)