// HTTP 응답전체를 감싸는 역활

class ResponseCore<T> {
  final int statusCode;
  final Map<String, String> header;
  final T body;

  // Response는 객체가 한번 만들어지면 변하지 않아야하니깐 const로 불변성
  // const 설정으로 인하여 필드의 값들은 final로
  const ResponseCore({
    required this.statusCode,
    required this.header,
    required this.body,
  });
}
