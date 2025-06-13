import 'package:modu_3_dart_study/250604/asset.dart';
/*
문제 1 의 회사에서, 형태가 없는 무형자산(IntangibleAsset) 도 관리하려고 생각하고 있다.
무형자산에는, 예를들어 특허권(Patent) 등이 있다.
무형자산도 유형자산도 자산(Asset)의 일종이다.
이것을 전제로 다음의 상속도의 가, 나, 다 부분의 클래스명을 생각 해 보시오.
또한, (가) 에 들어가는 추상 클래스를 개발하고, 이 클래스를 상속하도록 TangibleAsset 를 수정하시오.
*/
abstract class intangbleasset extends asset {
  String patent;

  intangbleasset(this.patent);
}