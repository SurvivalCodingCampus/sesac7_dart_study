# DART
- language developed by google to replace javascript
## Notable features of Dart 
### type safe + inferance
- **타입이 정의 되면 무조건 그 타입의 밸류만 변수에 들어갑니다**
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

## Constructor
```dart
class Hero {
    String name;
    int hp;
    Sword sword;
    
    // Constructor
    Hero(this.name, {this.hp = 10, required this.sword});
}
```

- `name` : outside { }, meaning its a necessary parameter. Caller of constructor must provide this parameter, but without naming the parameter.
- `hp` : inside { }, meaning its a named(optional) parameter. The caller of constructor either <br>
**1. use `hp: 5` to explicitly give** <br>
**2. or not provide at all and let the default value in(10)**
- `sword` : inside { }, meaning its a named(optional) parameter, but the required field is given. Therefore there is **no default value**. Required is for **any value without default, but cannot be null.**

```dart
final hero1 = Hero("이름1", hp: 30, sword: sword1) // okay
final hero1 = Hero("이름1", sword: sword1) // okay
final hero1 = Hero("이름2") // nope! need sword 
final hero1 = Hero(sword: sword2) // nope! need name
```

## Collections
### List
- Data structure with order
- allowing duplicate
- replaces array
```dart
final names = <String>[];

names.add('홍길동');
names.add('한석봉');
names.add('신사임당');

print(names[1]);
```
- Searching through list
```dart
for (int i = 0; i < names.length; i++) {
    print(names[i]);
}

for (final name in names) {
    print(name);
}

names.forEach((name) {
    print(name);
});

names.forEach(print);

final iterater = names.iterator;
while (iterator.moveNext()) {
    print(iterator.current);
}
```

### Map
- Data structure without order, set of key value pair. 
- No duplicates of key allowed.
```dart
Map<String, dynamic> gildong = {
    'name' : '홍길동',
    'id' : 0,
    'age' : 20,
};

gildong.entries.foreach((element) {
    print(element.key); // or element.value
});
```
### Set
- Data structure without order
- no duplicates.
```dart
Set<int> lottoSet = {1, 2, 3, 4};

print(lottoSet.contains(1));
print(lottoSet.contains(5));

final iterator = lottoSet.iterator;
while (iterator.moveNext()) {
    print(iterator.current);
}
```

