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
