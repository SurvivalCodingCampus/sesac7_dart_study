import 'package:test/test.dart';
import 'package:modu_3_dart_study/strong_box.dart';

void main() {

  test('key 생성 후 StrongBox 열기 시도가 동작한다',(){
    final testKey = KeyType(selectedLockType: LockType.padlock, value: 'padlock');
    final box01 = StrongBox();

    expect(box01.put(testKey), false);
  });

  test('padlock key로는 1023번째까지 실패하고 1024번째에 성공한다',(){

    final padlockKey = KeyType(selectedLockType: LockType.padlock, value: 'padlock');
    final box02 = StrongBox();

    // 1023번째까지 false
    for(int i = 0; i < 1024; i++){
      box02.put(padlockKey);
    }

    // 1024번째에 true
    expect(box02.put(padlockKey), true);
  });

  test('button key로는 10000번째에 성공한다',(){

    final buttonKey = KeyType(selectedLockType: LockType.button, value: 'button');
    final box03 = StrongBox();

    // 9999번째까지 false
    for(int i = 0; i < 10000; i++){
      box03.put(buttonKey);
    }

    // 10000번째에 true
    expect(box03.put(buttonKey), true);
  });

  test('dial key로는 30000번째에 성공한다',(){

    final dialKey = KeyType(selectedLockType: LockType.dial, value: 'button');
    final box04 = StrongBox();

    // 29999번째까지 false
    for(int i = 0; i < 30000; i++){
      box04.put(dialKey);
    }

    // 30000번째에 true
    expect(box04.put(dialKey), true);
  });

  test('finger key로는 1000000번째에 성공한다',(){

    final fingerKey = KeyType(selectedLockType: LockType.finger, value: 'finger');
    final box05 = StrongBox();

    // 999999번째까지 false
    for(int i = 0; i < 1000000; i++){
      box05.put(fingerKey);
    }

    // 1000000번째에 true
    expect(box05.put(fingerKey), true);
  });
}