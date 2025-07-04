import 'dart:convert';

import 'package:modu_3_dart_study/18_http/core/response_core.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/model/post.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  // post
  @override
  Future<ResponseCore<Post>> createPost(Post post) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/posts'), // Uri.parse()는 문자열 주소를 http 패키지가 사용하기 좋은 Uri 객체 형태로 변환
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post),
    );
    return ResponseCore(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  // delete
  @override
  Future<ResponseCore<void>> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/posts/$id'),);
    if (response.statusCode == 204) {
      return ResponseCore(statusCode: response.statusCode,
          header: response.headers,
          body: null);
    }
    return ResponseCore(statusCode: response.statusCode,
        header: response.headers,
        body: response.body.isNotEmpty ? jsonDecode(response.body) : null);
  }

  // get with id
  @override
  Future<ResponseCore<Post>> getPost(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/posts/$id'),);
    return ResponseCore(statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),);
  }

  // get
  @override
  Future<ResponseCore<List<Post>>> getPosts() async {
    final response = await http.get(Uri.parse('$_baseUrl/posts'),);
    return ResponseCore(statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),);
  }

  // patch
  @override
  Future<ResponseCore<Post>> patchPost(int id,
      Map<String, dynamic> postData) async {
    final response = await http.patch(Uri.parse('$_baseUrl/posts/$id'),);
    return ResponseCore(statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),);
  }

  // update
  @override
  Future<ResponseCore<Post>> updatePost(int id, Post post) async {
    final response = await http.put(Uri.parse('$_baseUrl/posts/$id'),);
    return ResponseCore(statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),);
  }
}