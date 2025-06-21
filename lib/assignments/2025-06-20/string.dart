void main() {
  String name = '홍길동';
  name = '한석봉';

  /// String name = '홍길동' 을 하면 힙에 홍길동이 생성이 된다. 그 주소는 100번이라고 한다면, 변수 name을 stack에 만들어서 거기에 100번 주소를 가지고있다.
  /// name = '한석봉' 하고 한석봉은 heap의 200번 주소를  가지고 name에다가 넣었어. 새로운 인스턴스를 만들고 할당만 다시 한거다.
  name = name + '님';

  ///이걸하면 한석봉님 이라는게 힙의 300번지에 새로 생기고, name은 그 300번 주소를 가지게 되는거다.
  ///String은 불변이기 때문에, 기존 인스턴스가 바뀌지 않는다.

  ///시간 잴 수 있는 기능 스톱워치.
  // Stopwatch stopwatch = Stopwatch();
  // stopwatch.start();
  // for (int i = 0; i < 100000; i++) {
  //   name = name + '님';
  // }
  // print(stopwatch.elapsed);
  // print(name);

  ///Instance를 만드는 헹위는 되게 비용이 많이 드는 작업인데, 위처럼 하면 10만개의 인스턴스를 생성한다. 굉장히 비용이 많이 든다.
  ///StringBuffer를 쓰면, 얘는 가변이구나.
  ///
  String str = 'hello';
  String str2 = 'hello';
  print(identical(str2, str)); //true.

  String str3 = String.fromCharCodes('hello'.codeUnits);

  ///메모리에 올라가는 시점 자체가 다르다. str,str2는 컴파일 타임에 , str3는 런타임에 메모리에 올라간다. 그래서 스트링풀에서 가는게아니라, str3는 메모리에 새로 올라간다. 런타임에 생성되는 문자열들과
  ///컴파일 타임에 올라가는 문자열은 다르다. 생성 시점의 차이부터 시작해서 메모리 공간 자체가 다르다.
  print(identical(str, str3));

  String str4 = 'hel' + 'lo';
  print(identical(str, str4));

  ///스트링 풀에서 오는게 아니라, 런타임에 결정된다.+ hel을 만들고 다시 hello를 만들기 때문에 다르다. 그리고 애초에 str,str2는 컴파일때 결정이 되기 때문에, 메모리 공간, 할당 시점자체가 다르다.

  String str5 = str + getLo();
  print(identical(str, str5));


  ///함수도 런타임때기 때문에,
}

String getLo() {
  return 'lo';
}
