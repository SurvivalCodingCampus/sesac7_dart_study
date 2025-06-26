import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/computer.dart';
import 'package:modu_3_dart_study/tangible_asset.dart';
import 'package:modu_3_dart_study/thing.dart';
import 'package:test/test.dart';

void main() {
  test('Given: Computer class when 인스턴스 생성 then 타입 체크', () {
    // given
    Computer computer = Computer(
      name: '그램',
      price: 2000000,
      color: 'white',
      makerName: 'LG',
      weight: 1.6,
    );
    // when
    // then
    expect(computer.weight, 1.6);

    expect(computer is Computer, true);
    expect(computer is TangibleAsset, true);
    expect(computer is Asset, true);
    expect(computer is Thing, true); // 의외의 결과
  });
}
