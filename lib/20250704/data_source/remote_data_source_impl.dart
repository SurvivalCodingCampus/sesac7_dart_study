import 'dart:convert';

import 'package:modu_3_dart_study/20250704/core/response.dart';
import 'package:modu_3_dart_study/20250704/data_source/remote_data_source.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  static const baseUrl = 'http://jsonplaceholder.typicode.com';
  static const  Map<String, String> headers = {"Content-Type": "application/json"};
  final http.Client _client;

  RemoteDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Response<Map<String, dynamic>>> createPost(
    Map<String, dynamic> post,
  ) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/posts'),
      headers: headers,
      body: jsonEncode(post),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<String>> deletePost(int id) async {
    final response = await _client.delete(
      Uri.parse('$baseUrl/posts/$id'),
      headers: headers,
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: response.body,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> getPost(int id) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/posts/$id'),
      headers: headers,
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<String>> getPosts() async {
    final response = await _client.get(
      Uri.parse('$baseUrl/posts'),
      headers: headers,
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: response.body,
      //body: List<Map<String, dynamic>>.from(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<String>> patchPost(int id, Map<String, dynamic> post) async {
    final response = await _client.patch(
      Uri.parse('$baseUrl/posts/$id'),
      headers: headers,
      body: jsonEncode(post),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: response.body,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> updatePost(
    int id,
    Map<String, dynamic> post,
  ) async {
    final response = await _client.put(
      Uri.parse('$baseUrl/posts/$id'),
      headers: headers,
      body: jsonEncode(post),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
}