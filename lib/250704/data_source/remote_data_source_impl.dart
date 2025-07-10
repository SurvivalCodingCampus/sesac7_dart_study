import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/250704/core/response.dart';
import 'package:modu_3_dart_study/250704/data_source/remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  static const baseUrl = 'http://jsonplaceholder.typicode.com';

  final http.Client _client;

  RemoteDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Response<Map<String, dynamic>>> createPost({
    required Map<String, dynamic> post,
  }) async {
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
  Future<Response<List<dynamic>>> getPosts() async {
    final response = await _client.get(Uri.parse('$baseUrl/posts'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<void>> deletePost({required int id}) async {
    final response = await _client.delete(Uri.parse('$baseUrl/posts/$id'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> getPost({required int id}) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/posts/$id'),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> patchPost({
    required int id,
    required Map<String, dynamic> post,
  }) async {
    final response = await _client.patch(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> updatePost({
    required int id,
    required Map<String, dynamic> post,
  }) async {
    final response = await _client.put(
      Uri.parse('$baseUrl/posts/$id'),
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

void main() async {
  final RemoteDataSource dataSource = RemoteDataSourceImpl();
  final result = await dataSource.createPost(
    post: {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
    },
  );

  print(result.body);
}
