import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/18_http/core/response.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';

import '../dto/post_dto.dart';

class JsonPlaceHolderDataSourceImpl implements RemoteDataSource {
  static const baseUrl = 'http://jsonplaceholder.typicode.com';

  final http.Client _client;

  JsonPlaceHolderDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Response<PostDto>> createPost(
    Map<String, dynamic> post,
  ) async {
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
      body: PostDto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<void>> deletePost(int id) async {
    final response = await _client.delete(Uri.parse('$baseUrl/posts/$id'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }

  @override
  Future<Response<PostDto>> getPost(int id) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/posts/$id'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: PostDto.fromJson(jsonDecode(response.body)),
    );
  }

  @override
  Future<Response<List<PostDto>>> getPosts() async {
    final response = await _client.get(
      Uri.parse('$baseUrl/posts'),
    );
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: (jsonDecode(response.body) as List)
          .map((e) => PostDto.fromJson(e))
          .toList(),
    );
  }

  @override
  Future<Response<PostDto>> patchPost(
    int id,
    Map<String, dynamic> post,
  ) async {
    final response = await _client.patch(Uri.parse('$baseUrl/posts/$id'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<PostDto>> updatePost(
    int id,
    Map<String, dynamic> post,
  ) async {
    final response = await _client.put(Uri.parse('$baseUrl/posts/$id'));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
}
