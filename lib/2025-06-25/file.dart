import 'dart:io';

void main() {
  final file = File('save.txt'); // 절대경로 작성 save.txt

  // 파일에 문자열을 추가 (append 모드)
  file.writeAsStringSync('hello\n', mode: FileMode.append);   // 줄바꿈 포함
  file.writeAsStringSync('hello\\', mode: FileMode.append);   // 역슬래시
  file.writeAsStringSync('hello\t', mode: FileMode.append);   // 탭

  // 파일의 모든 내용을 읽어서 출력
  final content = file.readAsStringSync();
  print(content);

  // 복사란 읽어서 쓰면 복사
}

// JSON 이 그래서 왜 컴퓨터도 편하다고 생각하는거지?
// 직렬화 JSON validator
// 런타임에 터질수 있음

// 테스트를 위해서 역직렬화 하면 됨
// final Map<String, dynamic> json = jsonEncode('''{ 
//   "email": "jina",
  
// }''');

// print(json['name']);
