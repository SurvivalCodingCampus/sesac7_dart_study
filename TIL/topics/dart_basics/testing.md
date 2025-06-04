# Testing

## How to Test
1. Pick a file to test
2. Under test directory, create filename_test.dart
3. given > when > then , using expect
```
import 'package:test/test.dart';

//메인 안에 

test ('Wizard Test', () {
    // given (준비)
    final wizard = Wizard(name: '마법사', hp: 100);

    // when (실행)
    wizard.heal(wizard);

    // then (검증)
    expect(wizard.hp, equals(20));
    expect(wizard.hp, 20);
    expect(wizard.hp == 20, equals(true));
    expect(wizard.hp == 20, true);
});
```
4. run with terminal 
```
dart test filename_test.dart
```

## Good reference
### Official web
- https://pub.dev/packages/test