# DART
- language developed by google to replace javascript
## Notable features of Dart 
### type safe + inferance
- 타입이 정의 되면 무조건 그 타입의 밸류만 변수에 들어갑니다
- use var keyword to declare inferable variable. Depending on value context, compiler decides the variable type.
```dart
var myNumber = 10; 
// integer
var myString = "Hello!";
// String
```

### null safety
- having ? after type makes the type nullable. Without ?, never null.
- String? != String
- ! after nullable makes it non-nullable. (Best after making sure its not null)
```dart
String? str1 = 'hello? am I null?';
str1 = null;
// OKAY

String str2 = 'I dont think I am null';
str2 = null;
// ERROR
```

```dart
String? str1 = "I am string!";
String str2 = str1;
// ERROR

String str2 = str1!;
//OKAY
```