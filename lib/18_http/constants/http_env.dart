/*
* Http 환경 설정 관련 상수
* */
class HttpEnv{
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static const  Map<String, String> headers = {"Content-Type": "application/json; charset=UTF-8"};

  static const int ok = 200;
  static const int created = 201;
  static const int noContent = 204;


  HttpEnv._();
}