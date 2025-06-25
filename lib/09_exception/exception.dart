import 'dart:io';

void main() {
  try {
    someError2();
  } catch(e) {
    print('여기');
  }
}

void someError2() {
  try {
    someError(11);
  } on FormatException {
    print('format error');
  }
}

void someError(int number) {
  if (number.isEven) {
    throw Exception('짝수는 안 돼');
  }

  throw FormatException('뻥');
}