## Enum
- 고정된 상수값을 나타내는 특별한 클래스
	- Enum 클래스를 자동으로 extends함
	- sealed 클래스이기 때문에 subclassing, implement, mixin, 명시적으로 인스턴스 생성 불가능

### Declaring enhanced enums
조건
- 인스턴스 변수는 반드시 final이어야 함
	- mixin에서 추가된 변수 포함
- 모든 generative constructor는 const여야 함
- factory constructor는 고정되고, 알려진 인스턴스만 리턴 가능
- 다른 클래스 extends 불가
- index, hashCode, == 오버라이드 불가
- values라는 이름의 멤버 선언 불가
	- 자동으로 생성되는 static getter values와 충돌
- 모든 인스턴스는 선언 시작부분에 선언되어야 함
	- 하나 이상의 인스턴스가 선언되어야 함

인스턴스 메서드는 this로 현재 값 참조 가능


## 참고
- https://dart.dev/language/enums