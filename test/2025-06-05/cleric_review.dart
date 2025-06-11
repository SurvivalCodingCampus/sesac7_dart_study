import 'package:modu_3_dart_study/2025-06-04/cleric.dart';

void main(){
  final cleric1 = Cleric(name: 'cleric1');
  // Cleric() 함수 앞에는 new 가 붙어있다

  // const cleric1 = Cleric(name: 'cleric1');
  // new 는 런타임에 생성되는 함수 값이기 때문에 const 값에 들어갈 수 없다

  const String name = "cleric1";
  // const 쓰면 이 값을 자주쓸것이고 여기 뿐아니라 다른 곳에서도 많이 사용할 경우 확정한다.

  print('$cleric1, $name');

  // 범위체크하는 matcher 확인하기 
}

// print로는 테스트를 확인 할 수 없다
// 결과를 리턴하는 명령어가 아니다
// 값이 없다


