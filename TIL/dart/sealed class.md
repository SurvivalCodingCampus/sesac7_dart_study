## sealed class
- 자체 라이브러리 외부로 확장 방지
	- 같은 라이브러리 내에만 있을 수 있기 때문에 subclass들의 패턴 매칭 가능
- 암시적 abstract
	- 자체 인스턴스 생성 불가
	- factory constructor 가능
	- subclass가 사용할 수 있는 constructor 정의 가능
- sealed class의 subclass는 암시적 abstract 아님
```dart
sealed class Vehicle {}

class Car extends Vehicle {}

class Truck implements Vehicle {}

class Bicycle extends Vehicle {}

// ERROR: Can't be instantiated.
Vehicle myVehicle = Vehicle();

// Subclasses can be instantiated.
Vehicle myCar = Car();

String getVehicleSound(Vehicle vehicle) {
  // ERROR: The switch is missing the Bicycle subtype or a default case.
  return switch (vehicle) {
    Car() => 'vroom',
    Truck() => 'VROOOOMM',
  };
}
```


## 참고
- https://dart.dev/language/class-modifiers#sealed