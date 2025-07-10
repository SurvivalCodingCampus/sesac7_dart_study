// Future<Response<List<Map<String, dynamic>>>> getPosts();
//
// Future<Response<Map<String, dynamic>>> getPost(int id);
//
// Future<Response<Map<String, dynamic>>> createPost(Map<String, dynamic> post);

import 'package:http/http.dart' as http;

abstract interface class UserModelDataSource {
  Future<String> getUser(int id);

  Future<String> getUsers();

  Future<String> createUser({required String email, required String password});
}

class UserModelDataSourceImpl implements UserModelDataSource {
  final http.Client _client;

  UserModelDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  final baseUrl = 'http://jsonplaceholder.typicode.com';

  @override
  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    final http.Response response = await _client.post(
      Uri.parse('$baseUrl/users'),
    );
    return response.body;
  }

  @override
  Future<String> getUser(int id) async {
    final http.Response response = await _client.get(
      Uri.parse('$baseUrl/users/$id'),
    );
    return response.body;
  }

  @override
  Future<String> getUsers() async {
    final http.Response response = await _client.get(
      Uri.parse('$baseUrl/users'),
    );
    return response.body;
  }
}
