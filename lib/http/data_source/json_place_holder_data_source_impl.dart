import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/http/reponse.dart';

class JsonPlaceHolderDataSourceImpl implements RemoteDataSource {
  static const String defaultUrl = 'http://jsonplaceholder.typicode.com';

  @override
  Future<Response<Map<String, dynamic>>> createPost(
    Map<String, dynamic> post,
  ) async {
    // 이건 http의 Response
    final response = await http.post(
      Uri.parse('$defaultUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
      }, // 헤더에 json 형식 지정
      body: jsonEncode(post), // Map 형태의 post를 encode하여 String으로 변환
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<void>> deletePost(int id) async {
    final response = await http.delete(
      Uri.parse('$defaultUrl/posts/$id'),
    ); // 이건 http의 Response

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null, // delete를 하는 경우에도 빈 객체가 전달되기는 함
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> getPost(int id) async {
    final response = await http.get(
      Uri.parse('$defaultUrl/posts/$id'),
    ); // 이건 http의 Response

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body), // String을 decode하여 Map 형태로 변환
    );
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getPosts() async {
    final response = await http.get(
      Uri.parse('$defaultUrl/posts'),
    ); // 이건 http의 Response

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(
        response.body,
      ).cast<Map<String, dynamic>>(), // String을 decode하여 List 형태로 변환
      // decode 결과 Map<String, dynamic>로 구성된 List 반환이 확실하므로 cast
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> patchPost(
    int id,
    Map<String, dynamic> post,
  ) async {
    final response = await http.patch(
      Uri.parse('$defaultUrl/posts/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(post), // post를 String으로 encode한 값으로 body 일부 수정
    ); // 이건 http의 Response

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> updatePost(
    int id,
    Map<String, dynamic> post,
  ) async {
    final response = await http.put(
      Uri.parse('$defaultUrl/posts/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(post),
    ); // 이건 http의 Response

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
}

void main() async {
  RemoteDataSource a = JsonPlaceHolderDataSourceImpl();
  final result = await a.createPost({
    'userId': 15550,
    'id': 10000,
    'title':
        '''sunt aut facere repellat provident occaecati excepturi optio reprehenderit, body: quia et suscipit
    suscipit recusandae consequuntur expedita et cum
    reprehenderit molestiae ut ut quas totam
    nostrum rerum est autem sunt rem eveniet architecto''',
  });
  print(result);

  // a
  //     .createPost({
  //       "userId": 1,
  //       "id": 1,
  //       "title":
  //           "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  //       "body":
  //           "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  //     })
  //     .then(print)
  //     .toString();
}
