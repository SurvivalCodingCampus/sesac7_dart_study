import 'package:modu_3_dart_study/asset/computer.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('ComputerClass Test', () {
    test('Computer 클래스 생성자 테스트', () {
      final String testComputerName = 'testComputer';
      final int testComputerPrice = 100000000;
      final String testComputerColor = 'White';
      final String testComputerTexture = 'Steel';
      final String testComputerMakerName = 'HP';
      final bool testComputerOsInstall = false;
      final double testComputerWeight = 1000;
      final double testComputerWidth = 15;
      final double testComputerHeight = 50;
      final double testComputerDepth = 45;
      final Computer computer = Computer(
        name: testComputerName,
        price: testComputerPrice,
        color: testComputerColor,
        texture: testComputerTexture,
        makerName: testComputerMakerName,
        isOsInstall: testComputerOsInstall,
        weight: testComputerWeight,
        tangibleAssetWidth: testComputerWidth,
        tangibleAssetHeight: testComputerHeight,
        tangibleAssetDepth: testComputerDepth,
      );

      expect(computer.name, equals(testComputerName));
      expect(computer.price, equals(testComputerOsInstall ? testComputerPrice + computer.osInstallPrice : testComputerPrice - computer.osInstallPrice));
      expect(computer.color, equals(testComputerColor));
      expect(computer.texture, equals(testComputerTexture));
      expect(computer.makerName, equals(testComputerMakerName));
      expect(computer.weight, equals(testComputerWeight));
      expect(computer.tangibleAssetWidth, equals(testComputerWidth));
      expect(computer.tangibleAssetHeight, equals(testComputerHeight));
      expect(computer.tangibleAssetDepth, equals(testComputerDepth));
    });
    test('Computer implements 변수 getter / setter 테스트', () {
      final String testComputerName = 'testComputer';
      final int testComputerPrice = 100000000;
      final String testComputerColor = 'White';
      final String testComputerTexture = 'Steel';
      final String testComputerMakerName = 'HP';
      final bool testComputerOsInstall = false;
      final double testComputerWeight = 1000;
      final double testComputerWidth = 15;
      final double testComputerHeight = 50;
      final double testComputerDepth = 45;
      final Computer computer = Computer(
        name: testComputerName,
        price: testComputerPrice,
        color: testComputerColor,
        texture: testComputerTexture,
        makerName: testComputerMakerName,
        isOsInstall: testComputerOsInstall,
        weight: testComputerWeight,
        tangibleAssetWidth: testComputerWidth,
        tangibleAssetHeight: testComputerHeight,
        tangibleAssetDepth: testComputerDepth,
      );

      /* Setter */
      computer.weight = 50;
      computer.tangibleAssetWidth = 20;
      computer.tangibleAssetHeight = 40;
      computer.tangibleAssetDepth = 60;

      /* Getter */
      expect(computer.weight, equals(50));
      expect(computer.tangibleAssetWidth, equals(20));
      expect(computer.tangibleAssetHeight, equals(40));
      expect(computer.tangibleAssetDepth, equals(60));
    });
    group('Computer 클래스 추상 메서드 adjustValue 구현부 테스트', () {
      test('생성자 isOsInstall false 생성시 생성자 블럭 adjustValue 호출 price 값 감소 테스트', () {
        final String testComputerName = 'testComputer';
        final int testComputerPrice = 100000000;
        final String testComputerColor = 'White';
        final String testComputerTexture = 'Steel';
        final String testComputerMakerName = 'HP';
        final bool testComputerOsInstall = false;
        final double testComputerWeight = 1000;
        final double testComputerWidth = 15;
        final double testComputerHeight = 50;
        final double testComputerDepth = 45;
        final Computer computer = Computer(
          name: testComputerName,
          price: testComputerPrice,
          color: testComputerColor,
          texture: testComputerTexture,
          makerName: testComputerMakerName,
          isOsInstall: testComputerOsInstall,
          weight: testComputerWeight,
          tangibleAssetWidth: testComputerWidth,
          tangibleAssetHeight: testComputerHeight,
          tangibleAssetDepth: testComputerDepth,
        );

        expect(testComputerPrice - computer.osInstallPrice, equals(computer.price));
      });
      test('생성자 isOsInstall true 생성시 생성자 블럭 adjustValue 호출 price 값 증가 테스트', () {
        final String testComputerName = 'testComputer';
        final int testComputerPrice = 100000000;
        final String testComputerColor = 'White';
        final String testComputerTexture = 'Steel';
        final String testComputerMakerName = 'HP';
        final bool testComputerOsInstall = true;
        final double testComputerWeight = 1000;
        final double testComputerWidth = 15;
        final double testComputerHeight = 50;
        final double testComputerDepth = 45;
        final Computer computer = Computer(
          name: testComputerName,
          price: testComputerPrice,
          color: testComputerColor,
          texture: testComputerTexture,
          makerName: testComputerMakerName,
          isOsInstall: testComputerOsInstall,
          weight: testComputerWeight,
          tangibleAssetWidth: testComputerWidth,
          tangibleAssetHeight: testComputerHeight,
          tangibleAssetDepth: testComputerDepth,
        );

        expect(testComputerPrice + computer.osInstallPrice, equals(computer.price));
      });
      test('isOsInstall false 생성 후 isOsInstall true 변경시 price 증가 테스트', () {
        final String testComputerName = 'testComputer';
        final int testComputerPrice = 100000000;
        final String testComputerColor = 'White';
        final String testComputerTexture = 'Steel';
        final String testComputerMakerName = 'HP';
        final bool testComputerOsInstall = false;
        final double testComputerWeight = 1000;
        final double testComputerWidth = 15;
        final double testComputerHeight = 50;
        final double testComputerDepth = 45;
        final Computer computer = Computer(
          name: testComputerName,
          price: testComputerPrice,
          color: testComputerColor,
          texture: testComputerTexture,
          makerName: testComputerMakerName,
          isOsInstall: testComputerOsInstall,
          weight: testComputerWeight,
          tangibleAssetWidth: testComputerWidth,
          tangibleAssetHeight: testComputerHeight,
          tangibleAssetDepth: testComputerDepth,
        );

        computer.isOsInstall = true;

        expect(testComputerPrice + computer.osInstallPrice, equals(computer.price));
      });
      test('isOsInstall true 생성 후 isOsInstall false 변경시 price 감소 테스트', () {
        final String testComputerName = 'testComputer';
        final int testComputerPrice = 100000000;
        final String testComputerColor = 'White';
        final String testComputerTexture = 'Steel';
        final String testComputerMakerName = 'HP';
        final bool testComputerOsInstall = true;
        final double testComputerWeight = 1000;
        final double testComputerWidth = 15;
        final double testComputerHeight = 50;
        final double testComputerDepth = 45;
        final Computer computer = Computer(
          name: testComputerName,
          price: testComputerPrice,
          color: testComputerColor,
          texture: testComputerTexture,
          makerName: testComputerMakerName,
          isOsInstall: testComputerOsInstall,
          weight: testComputerWeight,
          tangibleAssetWidth: testComputerWidth,
          tangibleAssetHeight: testComputerHeight,
          tangibleAssetDepth: testComputerDepth,
        );

        computer.isOsInstall = false;

        expect(testComputerPrice - computer.osInstallPrice, equals(computer.price));
      });
    });
  });
}
