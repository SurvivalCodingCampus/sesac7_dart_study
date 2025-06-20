/*
연습문제 1에서 작성한 StrongBox 클래스에 열쇠의 종류를 나타내는 열거형 KeyType을 정의하고,
다음 내용을 반영하여 StrongBox 클래스를 수정하시오.
  열쇠의 종류를 나타내는 필드 추가
  열쇠의 종류를 받는 생성자
단, 열쇠의 종류는 다음 4종류로 한정한다. 각 열쇠 종류는 시도횟수의 한도가 정해져 있다.
  padlock    (1,024회)
  button     (10,000회)
  dial       (30,000회)
  finger     (1,000,000회)
금고에서 get() 메서드를 호출할 때 마다 사용횟수를 카운트하고 각 열쇠의 사용횟수에 도달하기 전에는 null을 리턴한다.
*/


enum KeyType {
  padlock,
  button,
  dial,
  finger,
}
class StrongBox<T> {
  final int padlockLimitNum = 1024;
  final int buttonLimitNum = 10000;
  final int dialLimitNum = 30000;
  final int fingerLimitNum = 1000000;

  int padlockNum = 0;
  int buttonNum = 0;
  int dialNum = 0;
  int fingerNum = 0;

  T? _data;

  StrongBox(this._data);

  void put(T data) {
    _data = data;
  }

  T? get() {
    switch (_data) {
      case KeyType.padlock:
        if (padlockLimitNum < padlockNum) break;
        padlockNum++;
        return null;
      case KeyType.button:
        if (buttonLimitNum < buttonNum) break;
        buttonNum++;
        return null;
      case KeyType.dial:
        if (dialLimitNum < dialNum) break;
        dialNum++;
        return null;
      case KeyType.finger:
        if (fingerLimitNum < fingerNum) break;
        fingerNum++;
        return null;
      case null:
        break;
    }
    return _data;
  }
}

class Person{
  String name;
  int age;

  Person({required this.name, required this.age});
}
void main() {
  var sb = StrongBox<KeyType>(KeyType.padlock);
  sb.get();
  print(sb.padlockNum);
}