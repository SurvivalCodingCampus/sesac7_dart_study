import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/20250710/data_source/user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  static const baseUrl = 'http://jsonplaceholder.typicode.com';
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };
  final http.Client _client;

  UserDataSourceImpl({required http.Client? client})
      : _client = client ?? http.Client();

  @override
  Future<http.Response> createUser(Map<String, dynamic> post) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/users'),
      headers: headers,
      body: jsonEncode(post),
    ).timeout(Duration(seconds: 3));

    return response;
  }

  @override
  Future<http.Response> getUser(int id) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: headers,
    ).timeout(Duration(seconds: 3));

    return response;
  }

  @override
  Future<http.Response> getUsers() async {
    final response = await _client.get(
      Uri.parse('$baseUrl/users'),
      headers: headers,
    ).timeout(Duration(seconds: 3));

    return response;
  }
}
