enum NetworkError {
  requestTimeout(statusCode: 1000),
  parseError(statusCode: 2000),
  unauthorized(statusCode: 401),
  notFound(statusCode: 404),
  serverError(statusCode: 500),
  unknown(statusCode: -1);

  const NetworkError({required this.statusCode});

  final int statusCode;

  // 정수 코드로 enum을 찾아주는 팩토리
  factory NetworkError.fromStatusCode(int statusCode) {
    return NetworkError.values.firstWhere(
      (e) => e.statusCode == statusCode,
      orElse: () => NetworkError.unknown, // 일치하는 코드가 없으면 unknown 반환
    );
  }
}

// enum NetworkError {
// requestTimeout,
// unauthorized, //401
// notFound, //404
// serverError, //500
// unknown, //그외
// }
