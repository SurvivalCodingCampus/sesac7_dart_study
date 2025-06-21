enum KeyType {
  padlock(remainCount: 1024),
  button(remainCount: 10000),
  dial(remainCount: 30000),
  finger(remainCount: 1000000);

  final int _remainCount;

  const KeyType({required int remainCount}) : _remainCount = remainCount;

  int get remainCount => _remainCount;
}

//열쇠의 종류를 나타내는 열거형 KeyType을 정의하고,
//열쇠의 종류를 나타내는 필드 추가
// 열쇠의 종류를 받는 생성자
