import 'dart:io';

class DataSourceException implements Exception {
  final String message;

  DataSourceException(this.message);

  @override
  String toString() => 'DataSourceException: $message';
}

Future<String> getJsonFile(String filePath) async {
  final file = File(filePath);

  if (!await file.exists()) {
    print('$filePath 파일을 찾을 수 없습니다.');
    throw DataSourceException('$filePath 파일을 찾을 수 없습니다.');
  }

  final content = await file.readAsString();

  if (content.isEmpty) {
    print('$filePath 파일이 비어있습니다.');
    throw DataSourceException('$filePath 파일이 비어있습니다.');
  }
  return content;
}
