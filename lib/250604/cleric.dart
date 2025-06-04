/*
구현목록
1. 현실세계의 성직자 “클레릭"를 표현하는 클래스 Cleric 를 작성 하시오.
2. 성직자는 용사 처럼 이름과 HP를 가지고 있고, 추가로 마법을 사용하기 위한 MP를 가지고 있다.
3. Cleric 클래스에 “이름", “HP”, “최대 HP”, “MP”, “최대 MP”를 속성으로 추가 하시요.
4. 또한 HP와 최대 HP는 정수로 초기치 50, MP와 최대 MP는 정수로 초기치 10으로 하고,
5. 최대 HP와 최대 MP는 상수 필드로 선언 하시오.
6. 성직자는 “셀프 에이드" 라는 마법을 사용할 수 있고, MP를 5소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다.
7. 연습 1 에 선언한 Cleric 클래스에 “selfAid()” 메소드를 추가 하시오. 또한, 이 메소드는 인수가 없고, 리턴 값도 없다.
*/
class Cleric{

  // 속성
  final String name; // 이름
  int hp; // HP
  int mp; // MP
  final int maxHp = 50; // 최대 HP, 초기치(50), 상수 선언
  final int maxMp = 10; // 최대 MP, 초기치(10), 상수 선언

  // 생성자
  Cleric(this.name, this.hp, this.mp){
    hp = maxHp;
    mp = maxMp;
  }

  // selfAid메서드
  // 호출시 mp에서 -5를 더하고 HP를 최대치로 설정
  // mp가 0또는 이하가 될 경우 소모 문구표시
  void selfAid(){
    if(mp>=0){
      mp -= 5;
      hp = maxHp;
    }else{
      print("mp가 전부 소모 되었습니다.");
    }
  }
}