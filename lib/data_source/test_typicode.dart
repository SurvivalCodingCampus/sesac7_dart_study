import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> fetchData() async {
/*
  final String endpoint = 'apis.data.go.kr';
  final String path = '/1741000/pfc3/getPfctInfo3';

  final String serviceKey =
      '';

  final Map<String, String> queryParams = {
    'serviceKey': serviceKey,
    'pageIndex': '1',
    'recordCountPerPage': '1',
  };
*/

  final String endpoint = 'jsonplaceholder.typicode.com';
  final String path = '/todos/1';

  try {
    final uri = Uri.https(endpoint, path);
    print(uri);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      print(jsonData);
    } else {
      print('데이터를 가져오는 데 실패했습니다: ${response.statusCode}');
    }
  } catch (e) {
    print('오류가 발생했습니다: $e');
  }
}

void main() async {
  await fetchData();
}