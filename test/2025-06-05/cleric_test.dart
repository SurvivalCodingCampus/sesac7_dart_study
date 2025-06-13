// import 'package:test/test.dart';
// import 'package:modu_3_dart_study/2025-06-05/cleric.dart';

void main() {}

// void main(){

//   group('clearic constructor test',(){

//     // test 값 작성시 의미있는 값, 누구나 알아볼수 있는 값을 사용하기 위한다면
//     // Q. test 에서 사용하는 전역 값을 설정해줘야하나?

//     const int selfAidUsedMp = 5;

//     test('생성자 테스트',(){
//       // given(준비)
//       // Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
//       final cleric01 = Cleric('아서스', hp: Cleric.maxHp - 10, mp: selfAidUsedMp + 1);

//       expect(cleric01.mp, 6);

//       cleric01.selfAid();
//       // 생성자 이외의 것이 들어와서
//       // hp, mp 가 그 값이 맞는지
//       // selfAid 전에 테스트

//       // selfAid 한번 실행시
//       expect(cleric01.name, '아서스');
//       expect(cleric01.hp, Cleric.maxHp);
//       expect(cleric01.mp, 1);

//       // Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다
//       final cleric02 = Cleric('아서스', hp: Cleric.maxHp - 10);
//       final cleric03 = Cleric('아서스');

//       expect(cleric02.mp, Cleric.maxMp);
//       expect(cleric03.hp, Cleric.maxHp);
//       expect(cleric03.mp, Cleric.maxMp);

//       // when(실행)
//       cleric02.selfAid();
//       cleric03.selfAid();

//       // then(검증)
//       // 이 때, MP는 최대 MP와 같은 값이 초기화 된다
//       expect(cleric02.mp, Cleric.maxMp - selfAidUsedMp);
//     });

//   });
// }
