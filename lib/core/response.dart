class Response<T> {
  // 응답이 하나만 리턴하는게 아니라서 여러개의 필드를 만들어서 사용한다?
  // 네트워크 응답을 보다 명확하게 다루기 위해서
  // 제네릭 타입
  // 구조가 명확함: 분리된 필드로 가독성이 높음
  // 다양한 API 응답에 같은 구조로 사용 가능
  // 깔끔하게 추상화하여 전달 가능

  final int statusCode;
  final Map<String, String> header;
  final T body;

  const Response({
    required this.statusCode,
    required this.header,
    required this.body,
  });

  @override
  String toString() {
    return 'Response{statusCode: $statusCode, header: $header, body: $body}';
  }
}
