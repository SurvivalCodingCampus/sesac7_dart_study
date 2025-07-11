class Response<T> {
  // 각 필드의 타입은 이미 BaseResponse 추상 클래스에 정의되어있음.
  // Client 인터페이스에서 post의 인자로 받는 body는 Object? 타입으로 설정되어있음.
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

  Map<String, dynamic> toJson() {
    return {
      'statusCode': this.statusCode,
      'header': this.header,
      'body': this.body,
    };
  }

  factory Response.fromJson(Map<String, dynamic> map) {
    return Response(
      statusCode: map['statusCode'] as int,
      header: map['header'] as Map<String, String>,
      body: map['body'] as T,
    );
  }
}
