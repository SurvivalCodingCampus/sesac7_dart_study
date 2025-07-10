## 코드리뷰
---
1. import 'dar:math' as math;
   as math -> as는 패키지에 이름을 따로 부여.
   특별한 이유가 없는한 사용하지 말자.
2. 매직넘버를 줄이도록 즉, 직접 상수 대입 하지 말자.
3. Dart Analysis를 확인하여 클린한 코드로 수정하자
4. 줄임말은 대문자로 써도된다. 예) MP, HP
5. ctrl + / : 전부주석

---
1. 삼항연산자는 min max 함수로도 가능하다.
2. if(a<b) return a; 한줄로 사용하는것 Dart에서 Good
3. 로직 중간에 return이 없도록 하자.
   예) result = 0; 초기화
   return result;
4. Dart에서 코드는 아래와 같은 띄어쓰기를 지킬것.
   (o)
   if {

   } else {

   }

   (x)
   if {

   }
   else {

   }
5. (1 , 1) 띄어쓰기. 통일성 중요, 팀,프로젝트마다 컨벤셔널 지키는것이 중요.
---
0612
런타임에 시험하는 것이 어렵다. DateTime.now() 이런것들. -> 테스트 방법 틀림...

set으로 한것은 get으로 실제 값이 들어갔는지 확인
named 파라미터 적용

쓰는사람이 throw 할찌 고민 ,로직적으로는 할일을 순수하게 하지.
띄어쓰기 주의하자.

안전호출
wand?.name

정리를 일기처럼
그리고 마지막에 한줄정리

인공지능 사용하는건 좋으나...확인해야해.
인공지능이 만든게. 뭐같음..그래서 쓰레기를 걷어내고 리팩토링을 더욱더 해서.

커서ai, winsurf 이런것들을 조합해서 테스트도 진행하고.


---------------

상속을 작성을 거의 할일이 없지만 
상속을 받는걸 확인하고 읽으줄 알야지!

객체지향 up => 알고리즘 문제 <등장인물나오는거 등등 이런것들을 객체지향으로 각각을 class로>
객체지향으로 짜는 알고리즘


테스트를 위주로 작성하면안되
테스트가 불가능한것도 있으니깐


디폴트는 숨김으로 작성하자

좋은 테스트코드 디스크립션 작성요령

dart format . : 다트 코드정리했는지 확인

가로로 80자 해야함

테스트는 그때그때 몰아서하면 죽음...이다...

다트는 유닛테스트 : 기능만 테스트

처음에 테스트케이스를 목록으로 만들고 하는것이 좋다.

테스트코드는 모든 흐름으로 갔는지 생각하면서 해야한다 예를들어 if문 안에 if문등

다트는 싱글쓰레드 임 멀티쓰레드아님

연습1
생성자가 만들어져야함
상속

연습3 인터페이스 , 프로퍼티, 생성자에서 받아야해


추상클래스 인터페이스 연습문제


생성자 정리 옵션
analysis_options.yaml 에 추가

formatter:
trailing_commas: preserve

생성자 생성 plugin => Dart data class

ctrl+j 범위지정

alt shift up down : 이동


인터페이스는 특징을 가지는거

생성자는 클래스 만든사람마음. named를 하던지 말던지

영어 용어에도 익숙하자 - 다른사람과 커뮤니케이션을 위해서. 

객체지향 -> 현실세계와 맞추기위해 - 휴먼에러 격차 줄이고.(캡슐화, 상속..등등)


객체지향은 산 모양으로 하는것으로 하느것은 안좋다
공통된속성을 가지고 뽑아내서 만들수있도록 하자.

탑다운으로 설계하려는 습관을 가지다.
즉 bottom up 으로 설계하는것이 좋다.

인터페이스를 사용하는거을 두려워마라
인터페이스를 잘게 많이 쪼개도 된다.

플러터에서 API 코드방식,의도드를 이해할수있기때문에 연습!!!

인터페이스가 디폴트! 접근하자. 확장하는데 무리가 없어진다.

설계할때 잘하는사람이 하는게 좋을꺼같아. 정답은 없다.
말이 되면 되는것이다.

추상클래스 : 다 만들어 만들어놓고 그것부터시작해 이렇때
인터페이스 : 기능을 만들어야해.

설계는 기계가 하지만 방향성을 계속해서 지시해야하는것 중요.
즉 알아야 지적할수있고 방향성을 바로 잡을수있다.

ctrl + H 계층

ctrl + f12 structure 확인



/*
bool operator ==(Object other){
if(Hero is hero) {
}else {
}
}
*/


요즘 중요하는게 불변성!
시스템이 커지더라도 불변성을 유지하면서
결국에는 복사본을 만들면서 교체하는방식으로.

1700년 최저가 그정도 될것 확인해볼것


DateTime.now()
static 매서드가 아니야....
이름있는 생성자 - 라는 문법

```dart
  // Person.bbb(){ //<- 이렇게 이름을 붙인다.
  //    print();
  //  }
  //  
  //  Person.aaa();
  //  Person.bbb();
  //   // 여기서 뭐야..어떤것이 생성자야 결국 확인해봐야한다.
```


Comparable<> 타입을 넣어주어야한다.
- sort가 되게 하려하는것

other -> 즉 다이나믹이야.


copyWith에서는 불변(Date) 같은것은 괜찮아 하지만 내가만든 객체는 안된다.


sortedBy((hero)=>hero.name) //이름으로 정리



extention https://dart.dev/language/extension-methods
확장함수 - 기존의 클래스를 꺠지않고 기능을 확대하는.
extension
final 붙으면 상속금지 String 같은거


리스트를 다루다 실수를 많이한다
새로운 리스트를 만들어야지~

List<Hero> newList = [heros[0], Hero(name,100)];
hero[0].name = 'aa' <- 원본도 바뀌네. 이런이런..
그래서 깊은 복사를 hero[0].copyWith() 이렇게


파일은 최대한 분리하는 것이 좋다.

shift f6 전체 바꾸기

1000000 = 1_000_000 이렇게도 된다.

map은 바꿀수있다. 위험  없는 키값을 던지게 되면 null되니깐

substring 대신 str[1] 이렇게 확인

compareTo

Unmodifiable 다트에만있는거 - 이건 수정이 안된다. add()가 있는데 runtime에서 터진다.
list 안에 클래스 인스턴스등 레퍼런스 타입을 넣으면 그안에 속성을 바꿀수있기때문에 위험.

정규식은 인공지능이 다해주니깐 공부를 굳이.

파일복사 연습문제 1 -> 파일읽고 쓰면된다. 대용량파일을 고려안한다.
파일없을때 예외처리
원본과 복사본의 내용 비교

데이터형식
연습문제 
테스트 -> 역직렬화해서 확인


이런식으로 사용하면 try catch 안해도 된다.
int num = int.tryParse(numString) ?? 0;

Employee - 동등성, copyWith, hashCode 이거 해야지!
불면객체 동등성비교 복습 필요.

안드로이드 업데이트 하지마.

자동 테스트 코드 클래스명 드래그 한상테에서 Alt + enter

테스트후에 tearDown() -> 테스트 끝날때마다 실행

bin이 메인
운세앱

람다는 디버깅이 안된다.
alt + enter blockbody눌러서 람다안에 함수로 들어갈수있다.

안티패턴

7월 14일 전까지 인프런 47번까지 들어야함


일렬로 되어있는거
.json 확작장로 저장하면 정리됨

다트는 double int상관관계가아니기때문에 num 타입으로 받아야한다.

dataformat yy-MM-dd M은 대문자

터지는걸 걱정해야하는거...

final 있으면 getter있는거임

ListEquality.hash 

switch  
case 1 || 2 이런 표현식도있음

리뷰는 코드레빗
하지만 리팩토링은 작은것
비지니스 로직을 건들지말고

Alt + J 눌러서 같은거 선택하게

디버그 variable | Watch
변수 등록하고 계속 볼수있음

map where
데이터 표시할때 사용하니 익숙해지자...안익숙해져..

future가있으면 무조건 future로


인터페이스를 써라 생성자로 받아라

DDD
객체들이 도메인이라 보면된다

const로 하면 같은 객체로 
user1 = cont User('name',1);
user2 = cont User('name',1);
identical(user1,user2) -> true

@Jsonkey
내가 알수있도록 이름바꾸어서 할수있다.
원하는 이름으로 

모델을 먼저 만들자


equatable => 알아서 동등성 

선택사항은 두가지
jsontoDart 플러그인
jsonSerializable 

mockito
verify 화이트박스 테스트 메서드 타는지

모델클래스는 편안게 써야한다

인터페이스로 의존성을 줄이자
예를들어 random 같은거

의존성을 

테스트코드에서 하면 무조건 터짐! http로 하면 됨

데이터 소스는 데이터가져오는것만

거르는 로직은 repository

Response을 사용안한다면 더 복자해질꺼다 -> 어떻게 확인.

response 의존성을 줄이기 위해

dartToJson 라이브러리로 DTO
만들댸 전부 붙여넣어

모델은 datetime으로 DTO는 String으로 
즉 이름 안 맞추어도되 결국 앱에서 사용하는거는 model쪽이니깐

freezed 필드하고 생성자만 해놔~ 그럼 나머지는 만들어줄께

DTO를 사용안한다면 freezed를 

사용 설치하고 https://pub.dev/packages/freezed
@freezed 붙이고 with 붙이고 파일명.freezed.dart파일 하고
필드에 @override붙여주고

사이트 라이브템플릿에 dataclass 

연습문제 작업순서

작업순서
1. model
2. 인터페이스 정리
3. impl

폴더에 store class 를 jsonToDart 라이브러리를 사용하여 만들기
만든후에 코드정리 할것

null이 들어오면 안되는곳에는 !넣기

firstWhere같은경우 null 반환하기에 터진다.

리스트 같은것이있을때 copyWith가 이상하다.

pattern types 어렵다.

sealed 클래스는 상속이나 구현을 제한한다.

result패턴은 nullable을 뺼수가 있다.

