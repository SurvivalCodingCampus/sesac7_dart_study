import 'package:modu_3_dart_study/20250611/person.dart';
import 'package:modu_3_dart_study/20250611/wand.dart';
import 'package:modu_3_dart_study/20250611/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('캡슐화 테스트', () {
    test('마법사와 지팡이 테스트', () {

      final Wand wand1 = Wand('신비의 지팡이', power: 100);
      final Wand wand2 = Wand('', power: 100);

      expect(wand1.name.length >= 3, true); // 지팡이 이름 3자 이상
      expect(wand1.power, inInclusiveRange(0.5, 100)); // 마력범위 체크
      
      final Wizard wizard1 = Wizard('헤리포터', hp: 100, mp: -100, wand: wand1);
      final Wizard wizard2 = Wizard('', hp: 100, mp: 100, wand: wand2);

      expect(() => wizard2.wand = null, throwsException); // 마법사 생성 후 지팡이 null일때 Exception
      expect(wizard1.name.length, greaterThan(3)); // 마법사 이름 3자 이상
      expect(wizard1.hp, greaterThan(0)); // hp가 0이상인지 체크
      wizard1.hp = -100; // 마법사 HP 0미만으로 셋팅
      expect(wizard1.hp, 0); // 마법사 HP 0미만으로 셋팅 시에도 0으로 설정되있는지 체크
      expect(wizard1.mp, 0); // 마법사 생성 시 음수로 설정해도 MP가 0으로 설정되는지 체크

      expect(() => wand2.name, throwsException); // 지팡이 이름이 공백일 경우
      expect(wizard2.name, ''); // 마법사 이름이 공백일 경우
    });

    test('Student 클래스 생성 테스트', () {
      Student student1 = Student('도깨비', birthYear: 300);
      Student student2 = Student('임세환', birthYear: 1979);
      Student student3 = Student('미래에서온학생', birthYear: 12000);

      expect(() => student1.age, throwsException);
      expect(student2.age, DateTime.now().year - 1979);
      expect(() => student3.age, throwsException);
    });
  });
}