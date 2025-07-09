import 'package:modu_3_dart_study/core/response.dart';

abstract interface class RemoteDataSource{
  // 어떻게 줄건지 타입에서 결정해서 준다
  Future<Response<List<Map<String, dynamic>>>> getPosts();
  Future<Response<Map<String, dynamic>>> getPost(int id);
  Future<Response<Map<String, dynamic>>> creatPost(Map<String, dynamic> post);
  Future<Response<Map<String, dynamic>>> updatePost(
    int id, Map<String, dynamic> post,
  );
  Future<Response<Map<String, dynamic>>> patchPost(
    int id, Map<String, dynamic> post,
  );

  Future<Response<void>> deletePost(int id);
}


// https://pub.dev/packages/http/example
// Response 가 http 안에도 들어있음

// 굳이 return 해서 내가 만든 response로의 return을 만드는 이유는? 
// 라이브러리 의존성을 줄이기 위해서, 교체해도 대응을 할 수 있기 때문에
// 의존성을 줄여야 함

// 만약에 dio 로 라이브러리가 변경 될 경우 어떤 값들이 실제로 변경되나?
// import http 때문에 의존하고 있어서 테스트를 할 수 없다 왜?

// 1단계 이런식으로 작성하고 있음 http.post{}
// 2단계 client 라는 객체를 만들어서 기본 Client 객체사용

// Mock 객체로 해야함
// Mock 객체 런타임에 만드는 것
// httptest -> MockClient 라는 객체 제공

// 디버깅할때 실제 제공하고 있는 코드까지 안들어가는 이유
// https 

