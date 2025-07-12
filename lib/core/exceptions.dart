class JsonParsingException implements Exception {
  final String? message;

  JsonParsingException([this.message]);

  @override
  String toString() => message == null
      ? 'JsonParsingException'
      : 'JsonParsingException: $message';
}
