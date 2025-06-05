# Object Oriented Programing

## Object and Class
- Class는 틀, 하나의 Class로 여러개의 Object(Instance)를 만들어낼 수 있다.
- Field + Method 구성
```
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
```
Hero heroro = new Hero('heroro', 100);

Hero heroro = Hero('heroro', 100);
// new can be omitted
```