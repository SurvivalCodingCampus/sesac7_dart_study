# 데이터가 올바르게 들어오지 않을때

- 파일을 나눠서 작성한것은 역할분배를 해서 안정성과 트래킹을 하기 위해서 인데
- 데이터가 올바르게 들어오지 않았을때 datasource 파일에서 터지지 않고 repository 에서 터지게 된다.
- repository 는 로직을 담당하는 파일
- 안전하게 파일을 변환하는 파일을 만들어 줌 -> DTO

# DTO data transfer object
- 아무 개입도 없는 데이터 그 자체
- 데이터 소스를 모델 클래스로 변환하는 과정에서 순수하게 클래스에 담기 위한 중간 전달 객체
- JSON > DTO > Model Class
- 모델 클래스는 우리가 편하게 쓰기 위해 변환한것
- 잘못된 데이터 소스를 받더라도 안 터지게 하려는 클라이언트 개발자의 방어 수단
- 직렬화 역직렬화의 역할을 DTO가 한다 
- 휴먼에러 줄이기 위해 손대지 않는다


## Mapper
- Mapper는 DTO를 모델클래스로 변환하는 유틸 메서드
- 확장함수 활용 추천: extension TodoMapper on TodoDto
- Nullable 을 non-Nullable로 변환하는 것이 핵심
- DTP 전체를 변환하는 것이 아니다. 필요한 부분만!

- JSON > DTO > Mapper를 활용하여 Model Class로 변환 > 모델클래스 > repository

- DataSource는 DTO를 반환
- Repository는 Model로 변환하여 반환

## @freezed 사용시
List 내부값에 접근할 수 없도록 되어있다.
실제로 List 값 바꾸려면 copyWith 활용
That behavior can be disabled by writing:

```dart
@Freezed(makeCollectionsUnmodifiable: false)
abstract class Example with _$Example {
  factory Example(List<int> list) = _Example;
}

void main() {
  var example = Example([]);
  example.list.add(42); // OK
}
```
### @Freezed(makeCollectionsUnmodifiable: false)
- final List 는 선언은 final 이지만 실제로 List 내부 값들은 조작이 가능하다
- unmodifiable 해주면 List의 모든 값에 접근할 수 없도록 만들어준다


