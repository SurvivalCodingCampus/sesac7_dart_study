# 인수와 매개변수

## 1. 인수(argument)
- 함수를 실행할 때 실제로 input 한 값
```dart
void main(){
    const firstName = "jina"; // "jina"는 인수
    final fullName = getFullName(firstName, lastName); // firstName, lastName은 getFullName 함수의 인수
}
```

## 2. 매개변수(parameter)
- 함수의 잠재적 입력 값을 위한 자리 표시자
- 함수 선언시 매개변수는 괄호안에 표시됨
- 여러개의 매개변수가 필요한 경우 쉼표로 구분
```매개변수
String getFullName(String firstName, String lastName){
    return "full name: $firstName $lastName";
}
```
## 3. 위치기반 vs 이름기반
- 순서대로 값을 전달함 vs 이름을 직접 명시해서 전달함
