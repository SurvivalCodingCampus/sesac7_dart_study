/*
* ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
“홍길동의 나이는 20살”
“한석봉의 나이는 25살”
* */
void main() {
  final personInfos = [
    {'name': '홍길동', 'age': 20},
    {'name': '한석봉', 'age': 25},
  ];

  for (final personInfo in personInfos) {
    print('${personInfo['name']}의 나이는 ${personInfo['age']}살');
  }
}
