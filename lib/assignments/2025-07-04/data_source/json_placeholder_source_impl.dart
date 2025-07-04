import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-07-04/core/res.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/remote_data_source.dart';

class JsonPlaceholderSourceImpl implements RemoteDataSource {
  static const String _baseUrl = 'http://jsonplaceholder.typicode.com/photos';
  final http.Client _client;

  JsonPlaceholderSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Res> createPhoto(Map<String, dynamic> mapOfPhoto) async {
    final response = await _client.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(mapOfPhoto),
    );

    return Res(response.statusCode, response.headers, response.body);
  }

  @override
  Future<Res> deletePhoto(int id) async {
    final response = await _client.delete(Uri.parse('$_baseUrl/$id'));

    return Res(response.statusCode, response.headers, response.body);
  }

  @override
  Future<Res> getPhoto(int id) async {
    final response = await _client.get(Uri.parse('$_baseUrl/$id'));

    return Res(response.statusCode, response.headers, response.body);
  }

  @override
  Future<Res> getPhotos() async {
    final response = await _client.get(Uri.parse(_baseUrl));

    return Res(response.statusCode, response.headers, response.body);
  }

  @override
  Future<Res> patchPhoto(int id, Map<String, dynamic> mapOfPhoto) async {
    final response = await _client.patch(
      Uri.parse('$_baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(mapOfPhoto),
    );

    return Res(response.statusCode, response.headers, response.body);
  }

  @override
  Future<Res> updatePhoto(int id, Map<String, dynamic> mapOfPhoto) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(mapOfPhoto),
    );

    return Res(response.statusCode, response.headers, response.body);
  }
}
