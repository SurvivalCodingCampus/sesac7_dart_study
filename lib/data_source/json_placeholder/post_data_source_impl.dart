import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/json_placeholder/post_data_source.dart';
import 'package:modu_3_dart_study/core/response.dart';

class PostDataSourceImpl implements PostDataSource {
  static const baseUrl = 'jsonplaceholder.typicode.com';
  static const postsPath = 'posts';
  static const contentTypeKey = 'Content - Type';
  static const contentTypeValue = 'application/json';

  final http.Client _client;

  PostDataSourceImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<Response<String>> createPost(String post) async {
    final response = await _client.post(
      Uri.https(baseUrl, postsPath),
      headers: {contentTypeKey: contentTypeValue},
      body: post,
    );
    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<Response<String>> deletePost(int id) async {
    final response = await _client.delete(
      Uri.https(baseUrl, '$postsPath/$id'),
    );
    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<Response<String>> getPost(int id) async {
    final response = await _client.get(
      Uri.https(baseUrl, '$postsPath/$id'),
    );
    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<Response<String>> getPosts() async {
    final response = await _client.get(
      Uri.https(baseUrl, postsPath),
    );
    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<Response<String>> patchPost(int id, String post) async {
    final response = await _client.patch(
      Uri.https(baseUrl, postsPath),
      headers: {contentTypeKey: contentTypeValue},
      body: post,
    );
    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<Response<String>> updatePost(int id, String post) async {
    final response = await _client.put(
      Uri.https(baseUrl, postsPath),
      headers: {contentTypeKey: contentTypeValue},
      body: post,
    );
    return Response(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }
}
