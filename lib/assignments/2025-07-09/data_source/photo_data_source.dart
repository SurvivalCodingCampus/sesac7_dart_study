import 'package:http/http.dart' as http;

abstract interface class PhotoDataSource {
  Future<String> getPhotos();
}

class PhotoDataSourceImpl implements PhotoDataSource {
  final http.Client _client;

  PhotoDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  final baseUrl = 'http://jsonplaceholder.typicode.com';

  @override
  Future<String> getPhotos() async {
    final http.Response response = await _client.get(
      Uri.parse('$baseUrl/photos'),
    );

    return response.body;
  }
}
