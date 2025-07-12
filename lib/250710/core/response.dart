class Response<T> {
  final int statusCode;
  final Map<String, String> header;
  final T body;

  Response({
    required this.statusCode,
    required this.header,
    required this.body,
  });
}
