import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/16_http/core/response.dart';
import 'package:modu_3_dart_study/16_http/data_source/remote_data_source.dart';

class JsonPlaceHolderDataSourceImpl implements RemoteDataSource {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<Response<Map<String, dynamic>>> createPost(
    Map<String, dynamic> post,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/posts'),
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
    final response = await http.delete(
      Uri.parse('$_baseUrl/posts/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getPost(int id) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/posts/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> getPosts() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> patchPost(
    int id,
    Map<String, dynamic> post,
  ) async {
    final response = await http.patch(
      Uri.parse('$_baseUrl/posts/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(json),
    );

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
      Uri.parse('$_baseUrl/posts/$id'),
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
}
