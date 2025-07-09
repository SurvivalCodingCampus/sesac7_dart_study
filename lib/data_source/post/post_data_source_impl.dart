import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/post/post_data_source.dart';

class PostDataSourceImpl implements PostDataSource {
  static const baseUrl = 'http://jsonplaceholder.typicode.com';

  final http.Client _httpClient;

  PostDataSourceImpl([http.Client? client])
    : _httpClient = client ?? http.Client();

  @override
  Future<Response<Map<String, dynamic>>> createPost(Map<String, dynamic> post) async {
    final http.Response response = await _httpClient.post(
      Uri.parse('$baseUrl/posts'),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
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
    final http.Response response = await _httpClient.delete(
      Uri.parse('$baseUrl/posts/$id'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> getPost(int id) async {
    final http.Response response = await _httpClient.get(
      Uri.parse('$baseUrl/posts/$id'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getPosts() async {
    final http.Response response = await _httpClient.get(
      Uri.parse('$baseUrl/posts'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((post) => post as Map<String, dynamic>)
          .toList(),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> patchPost(int id, Map<String, dynamic> post) async {
    final http.Response response = await _httpClient.patch(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
      body: jsonEncode(post),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> updatePost(int id, Map<String, dynamic> post) async {
    final response = await _httpClient.put(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
      body: jsonEncode(post),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
}
