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
    int get age {
        return _age;
    }

    set name(String value) => _name = value;
    set age(int value) {
        if (value >= 0) {
            _age = value;
        }
    }
}

// with age setter method can make sure only valid modification to age is applied.
```
- Can also throw exception when user tries to set value with unacceptable input.

## Inheritance
Enables programmer to reuse a class and extend its functionality to create more **specialized and concrete** subclass. Also enables utilizing the concept of **polymorphism**
### Inheritance in dart
```dart
class Hero {
    int hp;
    String name;
}
class SuperHero extends Hero{

}
```
### Multi-inheritance
- not allowed in dart unlike c++
- but can work around to get the effect with mixin(More later).

### Override
- can redefine the method of parent class.
- place @override annotation over it for easier readability
- still can access parents method by using super.class

### Constructor
- Also can basically override the constructor.
- using super keyword to access previously defined fields and properties.

### Is-A principle
- childclass *IS a* parent class
- child class is more concrete and down-to-earth while parent class is more abstract and general.

### Instance structure
- Child instance basically *Contains* the parent instance within.
- The outer field methods are called first.
- Accessing internal instance requires using the keyword super

### Abstract Class
- Classes intentionally unfinished to be fully implemented after inheritance
- subclasses must override abstract methods
- cannot be instantiated

```dart
abstract class Asset {

}
```

### Interface
- A special case of abstract classes
- **every method abstract**
- **no field**
- guarantees common method support among implementers
- A class can implement multiple interfaces

```dart
abstract interface class Attackable {

}
class Hero implements Attackable {
    
}
```