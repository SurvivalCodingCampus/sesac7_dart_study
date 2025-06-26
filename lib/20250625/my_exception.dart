class MyException implements Exception {
  static const FILE_NOT_FOUND = '파일을 찾을 수 없습니다.';
  static const FILE_CONTENTS_EMPTY = '파일 내용이 없습니다.';
  static const FILE_NAME_EMPTY = '경로가 비어있습니다.';

  final String? _message;

  MyException([this._message]);

  @override
  String toString() {
    if (_message == null) return 'MyException is Unknown';
    return 'MyException: $_message';
  }
}