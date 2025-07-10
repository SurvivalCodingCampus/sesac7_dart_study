import 'dart:convert';

import 'package:modu_3_dart_study/18_http/constants/http_env.dart';
import 'package:modu_3_dart_study/18_http/core/response_core.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/model/post.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  http.Client _client;

  // 의존성 주입
  RemoteDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  // post
  @override
  Future<ResponseCore<Post>> createPost(Post post) async {
    final response = await _client.post(
      Uri.parse('$HttpEnv.baseUrl/posts'),
      // Uri.parse()는 문자열 주소를 http 패키지가 사용하기 좋은 Uri 객체 형태로 변환
      headers: HttpEnv.headers,
      body: jsonEncode(post),
    );
    return ResponseCore(
      statusCode: response.statusCode,
      header: response.headers,
      body: Post.fromJson(jsonDecode(response.body)),
    );
  }

  // get with id
  @override
  Future<ResponseCore<Post>> getPost(int id) async {
    final response = await _client.get(
      Uri.parse('${HttpEnv.baseUrl}/posts/$id'),
    );
    return ResponseCore(
      statusCode: response.statusCode,
      header: response.headers,
      body: Post.fromJson(jsonDecode(response.body)),
    );
  }

  // get
  @override
  Future<ResponseCore<List<Post>>> getPosts() async {
    final response = await _client.get(Uri.parse('${HttpEnv.baseUrl}/posts'));
    return ResponseCore(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((post) => Post.fromJson(post))
          .toList(),
    );
  }

  // update
  @override
  Future<ResponseCore<Post>> updatePost(int id, Post post) async {
    final response = await _client.put(
      Uri.parse('${HttpEnv.baseUrl}/posts/$id'),
      headers: HttpEnv.headers,
      body: jsonEncode(post),
    );
    return ResponseCore(
      statusCode: response.statusCode,
      header: response.headers,
      body: Post.fromJson(jsonDecode(response.body)),
    );
  }

  // patch
  @override
  Future<ResponseCore<Post>> patchPost(
    int id,
    Map<String, dynamic> postData,
  ) async {
    final response = await _client.patch(
      Uri.parse('${HttpEnv.baseUrl}/posts/$id'),
      headers: HttpEnv.headers,
      body: jsonEncode(postData),
    );
    return ResponseCore(
      statusCode: response.statusCode,
      header: response.headers,
      body: Post.fromJson(jsonDecode(response.body)),
    );
  }

  // delete
  @override
  Future<ResponseCore<void>> deletePost(int id) async {
    final response = await _client.delete(
      Uri.parse('${HttpEnv.baseUrl}/posts/$id'),
    );
    return ResponseCore(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }
}
