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

gildong.entries.forEach((element) {
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

## Generic methods for dart objects
- Every class is subclass of Object, therefore include its methods and properties: namely toString(), operator==, hashcode.
- operator== is also used to test 'equality' in lists
- hashCode is also used to test 'eqaulity' in sets and maps

### toString()
- Often overridden for user-defined classes to customize the string output of an instance when it is converted to String in print statements for example.

### operator==
- By default, this only compares the reference address, therefore often programmer want to override this method to treat 'logically equal instances' equal.
```dart
@override
bool operator==(Object other) =>
    identical(this, other) || other is Hero && runtimeType == other.runtimeType && name == other.name;
```
- identical(object A, object B) will still strictly do the 'reference address' eqaulity check

### hashCode
- By default, every different instances in different address will give out unique and different hashcodes.
- By overriding this method, programmer can make two logically equal instances to return same hashcode
```dart
int get hashCode => name.hashCode ^ age.hashCode; 
// or any other member fields that are relevant to treat two instances 'equal'
```

### comparable interface and compareTo()
- Dart data collections, namely list supports sorting.
- Usually put in anonymous comparator function, but for default, sort function will make use of our compareTo method to make the comparison.
- In case of (a, b) returning negative will put a before b, positive will put b before a.
- Implement Comparable<> interface
```dart
class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }
}
```

### Instance copy
- classes being reference types often makes programmer to make separate copies of instances instead of just making new reference.
- copyWith() is the de facto official method for it
- If class include another field of class, that should be copied too. Doing so is called deep copy.
```dart
class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  Book copyWith() =>
      Book(title: title, comment: comment, publishDate: publishDate.copyWith());
}
```

### Exception 
- Programmer should expect unexpected situations during runtime and prepare the handling beforehand.
- Possible unexpected situations include:
1. out of memory
1. unable to find a file
1. network issues

```dart
try {
    // code that can possibly cause exceptions
} catch (e) {
    // rethrow 
}
```
- rethrow keyword lets the upper scope to handle the exception, but it is not necessary since dart will automatically rethrow it without being explicit.
- on keyword lets you to handle cases of specific exceptions
- may have custom exceptions that implement **Exception** interface

### File manipulation
- rule of thumb is :
1. open the file
2. manipulate it
3. close the file

- but, luckily dart will handle the closing part without programmer being explicit about closing.

```dart
final file = File('save.txt'); // or may use absolute path
final text = file.readAsStringSync();
// or
//file.writeAsStringSync(text); with optinal parameter mode  
```

### Dealing with data files
- CSV : comma separated data files, simple to use
- properties : key value pair data file
- XML : just like HTML use tag to organize small data into a discernable structure, usually require parser
- Json : key value pair data file, [] for list, {} for object. Most preferred at the moment.

### Serialize
- transform an object or data structure into a format that is easy to save and transport. Here, we aim to serialize them into Json format.
- Within class, create fromJson and toJson: fromJson will convert map<string, dynamic> to instance and toJosn will convert map to instance.
```dart
class User {
    final String name;
    final String email;

    User.fromJson(Map<String, dynamic> json)
        :   name = json['name'];
            email = json['email'];

    Map<String, dynamic> toJson() {
        return {'name' : name, 'email' : email};
    }
}
```
- then use jsonDecode(jsonString) to make string into map
- use jsonEncode(map) to make map into string