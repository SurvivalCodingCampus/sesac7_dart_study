# Result 패턴

## 성공과 실패 중 하나를 리턴하는 Result 클래스 예시
- Result 클래스는 성공시에는 데이터를, 실패시에는 에러 정보(예: Exception, String)를 담는 객체를 정의한다

### sealed
- 확장(상속)할 수 있는 범위를 제한하는 클래스
- 다른 파일에서 상속할 수 없다, 같은 파일 안에서만 extends, implements, with 할 수 있다
- 런타임에는 클래스가 확장 가능한지 추론하기 쉬워서 패턴 매칭(switch/ case)에 유리하다
- sealed 클래스는 타입 봉인 효과를 가진다 (enum 하고 비슷한 효과)
- 여러 하위 타입이 있을 수 있는 **분기 가능한 타입 시스템**

```dart
// 예시: 열거형 enum 처럼 정해진 하위 타입 집합을 만들고 싶을때
sealed class Result {}

class Success extends Result {}
class Failure extends Result {}

Result handle() => Success();

void main() {
  final result = handle();
  switch (result) {
    case Success():
      print('OK');
    case Failure():
      print('Error');
  }
}
```

- 다른 객체의 참조를 가질 수 있다: sealed 클래스 정의할 때 다른 클래스나 객체를 필드로 가질 수 있다. 내부에 다른 인스턴스 담을 수 있다.

### Result 패턴 사용시 효과
1. enum 과 동일하게 switch 문과 조합하여 모든 처리를 강제할 수 있다
2. 성공과 실패를 처리할 수 있다
3. 타입안정성 향상
4. 에러처리 강제성(컴파일러가 모든 케이스 처리를 강제함)
5. 에러타입의 명확한 문서화
6. try-catch 남용 방지
7. 비지니스 로직과 에러처리 분리
8. Nullable 타입 감소
9. 테스트 용이성
10. 패턴 매칭을 통한 가독성 향상

- enum 은 클래스만큼 자유롭지 않다: equals, hashcode 재정의가 불가능하다
- sealed class 는 서브타입을 봉인한다