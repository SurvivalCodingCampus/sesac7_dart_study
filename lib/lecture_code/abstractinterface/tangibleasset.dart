import 'package:modu_3_dart_study/lecture_code/abstractinterface/asset.dart';
import 'package:modu_3_dart_study/lecture_code/abstractinterface/thing.dart';
/*
어떤 회사에서 자산관리 프로그램을 만들려고 한다. 현시점에서 컴퓨터, 책 을 표현하는, 다음과 같은 두개의 클래스가 있다
이후, 컴퓨터와 책 이외에도 여러가지 자산을 관리하고 싶은 경우에 유용한 유형자산(TangibleAsset) 이라는 이름의 추상클래스를 작성 하시오.
또, Computer 나 Book 은 그 부모 클래스를 활용한 형태로 수정 하시오.
*/
/*
유형자산 (TangibleAsset) 은, 자산 (Asset) 의 일종이며, 형태가 있는 것 (Thing) 의 일종이기도 하다.
이 정의에 맞도록 TangibleAsset 의 소스 코드를 수정하시오.
이 때, TangibleAsset 에 필드나 메소드의 추가가 필요하다면, 적당히 추가하시오.
*/

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _defaultNum = 1.1;

  TangibleAsset(super.name, super.price, this.color);

  @override
  double get weight => _defaultNum;

  @override
  set weight(double weight) {}
}