import 'dart:io';

class CsvDataSourceException implements Exception {
  final String message;

  CsvDataSourceException(this.message);

  @override
  String toString() => 'DataSourceException: $message';
}

Future<String> getCsvFile(String filePath) async {
  final file = File(filePath);

  if (!await file.exists()) {
    throw CsvDataSourceException('$filePath 파일을 찾을 수 없습니다.');
  }

  final content = await file.readAsString();

  if (content.isEmpty) {
    throw CsvDataSourceException('$filePath 파일이 비어있습니다.');
  }
  return content;
}
