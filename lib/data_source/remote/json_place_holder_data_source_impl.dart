import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/remote/remote_data_source.dart';

// https://jsonplaceholder.typicode.com/

class JsonPlaceHolderDataSourceImpl implements RemoteDataSource{

  // static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  final String baseUrl;

  // http.Client();는 실제 http 요청을 보내고 응답을 받아오는 객체다
  // 내부에 get(), post() 같은 메서드가 있다
  // http.get(...) 은 실제로 http.Client().get() 이다

  http.Client _client;
  JsonPlaceHolderDataSourceImpl({http.Client? client, required this.baseUrl}) : _client = client ?? http.Client();

  // nullable로 설정하고 Null 인경우 기본 통신객체를 생성하는 http.Client()로 대체한다

  
  @override
  Future<Response<Map<String, dynamic>>> creatPost(Map<String, dynamic> post) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(post),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<void>> deletePost(int id) async {
    final response = await _client.delete(Uri.parse('$baseUrl/posts/$id'));

    return Response (
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }
  // 제네릭 타입으로 void가 들어온 경우 body에서 null을 리턴하는 것을 유일하게 허락한다

  @override
  Future<Response<Map<String, dynamic>>> getPost(int id) async {
    final response = await _client.get(Uri.parse('$baseUrl/posts/$id'));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getPosts() async {
    final response = await _client.get(Uri.parse('$baseUrl/posts'));
    final decoded = jsonDecode(response.body);

    // response.body 는 항상 List<dynamic> 타입을 반환한다
    // 

    if (decoded is List<dynamic>) {
      final castedBody = decoded.cast<Map<String, dynamic>> ();

      return Response(
        statusCode: response.statusCode,
        header: response.headers,
        body: castedBody,
      );
    } else {
      throw Exception('response format is not a List');
    }

    
  }

  @override
  Future<Response<Map<String, dynamic>>> patchPost (int id, Map<String, dynamic> post) async {
    final response = await _client.get(Uri.parse('$baseUrl/posts/$id'));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> updatePost(int id, Map<String, dynamic> post) async {
    final response = await _client.get(Uri.parse('$baseUrl/posts/$id'));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
  
}

// http 에 있는 response?