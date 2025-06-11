# Object Oriented Programming

## Object and Class
- Class는 틀, 하나의 Class로 여러개의 Object(Instance)를 만들어낼 수 있다.
- `Field` + `Method` 구성
```dart
class Hero {
    String name;
    int hp;

    Hero(this.name, this.hp); // Constructor;

    void attack() {
        
    }
}
```

### Instantiate
- A class type variable can contain its instance
```dart
Hero heroro = new Hero('heroro', 100);

Hero heroro = Hero('heroro', 100);
// new can be omitted
```

### Memory and Instances
- Instance is basically the `memory allocated within the heap` by using the keyword 'new' 
- local variables are allocated in stack :
1. Primary types in older languages : hold the `value`
2. Reference types : hold the `address of this value`. **(in the heap)**

> Dart actually holds every type in reference, but they behave and follow the old school rule

### Static field and methods
- use `static` keyword to share one single field reference across all instances of a class.
- static field is basically global top-level variable:
    - resides in a different memory section than non-static fields(*heap*)
    - different lifespan (exists before any instances are instantiated)
    - different access
    ```dart
    class Hero {
        static int money = 100;
    }

    Hero hero = Hero();

    hero.money = 0; // nope
    Hero.money = 0; // OKAY
    ```
- static method is method version of static field. Can **only access static field** within the method.
    ```dart
    import 'dart:math';

    class Hero {
        static int money = 100;
        String name;
        int hp;
        
        static void setRandomMoney() {
            money = Random().nextInt(1000);
        }
    }
    ```

## Encapsulation
Prevents user's human error, by only allowing access to private fields via controlled getters and setters, possibly with input validations. Rule of thumb is to throw **exception** when parameters are largely invalid. But simply replacing it with acceptable value is also possible.

### Encapsulation in dart
Make any field, method, or even class private by adding _ before the identifier.
- fields that are defined with named parameter in the constructor will have to be tweaked.
```dart
class Hero {
    String name;
    int _hp;
    Sword? sword = null;

    Hero({required this.name, required int hp}) : _hp = hp;
}

// hp field became private
```

- Instead of private field, dart getters and setters allows programmer to have representative **property** and make sure values are within expected behavior.

```dart
class Person {
    String _name;
    int _age;

    Person(this._name, this._age);

    String get name => _name;
    String get age {
        return _age;
    }

    set name(String value) => _name = value;
    set age(int value) {
        if (value >= 0) {
            _age = value;
        }
    }
}

// with age stter method can make sure only valid modification to age is applied.
```
- Can also throw exeption when user tries to set value with unacceptable input.