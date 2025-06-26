void main() {
  try {} catch (e) {
  } finally {
    print('hello');
  }
}

void someError2() {
  someError();
}

void someError() {
  throw FormatException('펑');
}
