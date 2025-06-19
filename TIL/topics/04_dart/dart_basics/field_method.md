# 필드와 메소드

## 필드
- 클래스 안에서 정의된 변수
- 클래스가 가지고 있는 속성을 나타냄

## 메소드
- 클래스 안에서 동작하는 함수

## 네이밍 컨벤션
| 구분 | 속성 | 내용 | 예시 |
| :--- | :--- | :--- | :--- |
| `클래스명` | 명사 | 단어의 맨 처음은 대문자(pascal) | Hero, MonsterInfo |
| `필드명` | 명사 | 최초 이외의 단어의 맨 처음은 대문자(camel) | itemList |
| `메소드명` | 동사 | 최초 이외의 단어의 맨 처음은 대문자(camel) | findWeakPoint |

## 작성 예시 및 영역별 예시
```dart
// 클래스 명(pascalcase 사용)
class Hero{
  // 필드영역
  // 필드명 camelcase
  String name;
  int hp;

  Hero(this.name, this.hp); //생성자

  // 메소드명(camelcase)
  void attack(){
    
  }

}
// main 은 여러번 작성할 수 있음
// void 사용시 return 값이 없음
// return 이 필요할때는 `int main()` 이런 형식으로 작성
void main(){

}
```

## 함수 반환 타입
1. `void`: 콘솔에 출력만 하는 등의 부가적인 효과만 필요할때. 값을 반환하지 않는 함수.
2. `String` 등 타입 지정: 해당하는 값을 반환해야하는 함수. return 이 꼭 필요하다는 의미.

* **return 값이란?**: 함수 실행 후 결과값을 함수에서 다시 사용할 수 있는 값