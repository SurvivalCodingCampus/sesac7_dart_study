# 파일 조작

## 파일 조작의 기본 순서
1. 파일을 연다
2. 파일을 읽거나 쓴다
3. 파일을 닫는다

```dart
final file = File('save.txt'); // 파일 열기
final text = file.readAsStringSync(); // 파일 읽기
final text = file.writeAsStringSync('내용', mode: FileMode.append); // 파일 쓰기, 파일이 없다면 새로 생성하면서 이어쓰기 함
final text = file.writeAsStringSync('내용', mode: FileMode.write); // 파일 쓰기, 파일이 없다면 새로 생성하면서 완전히 덮어쓰기 함
```

## File
- FileSystemException: 파일시스템 관련 오류 발생시 사용하는 예외 클래스
- existsSync(): 파일이 있는지 확인
- createSync(): 파일 만들기