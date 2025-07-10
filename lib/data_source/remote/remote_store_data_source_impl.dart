import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/remote/remote_store_data_source.dart';

// https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json

import '../../dto/store_dto.dart'; // DTO 생성하면서 타입을 모두 DTO를 거쳐서 받게 수정

class RemoteStoreDataSourceImpl implements RemoteStoreDataSource {
  // static const _baseUrl = 'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
  final String baseUrl;

  // http.Client();는 실제 http 요청을 보내고 응답을 받아오는 객체다
  // 내부에 get(), post() 같은 메서드가 있다
  // http.get(...) 은 실제로 http.Client().get() 이다

  http.Client _client;
  RemoteStoreDataSourceImpl({http.Client? client, required this.baseUrl})
    : _client = client ?? http.Client();

  // nullable로 설정하고 Null 인경우 기본 통신객체를 생성하는 http.Client()로 대체한다

  @override
  Future<Response<StoreDto>> createStore(StoreDto store) async {
    final response = await _client.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(store),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: StoreDto.fromJson(jsonDecode(response.body)),
      // jsonDecode(response.body) : 문자열을 Map 으로 변환(key, value 값 있는)
      // jsonDecode(response.body) 값을 fromJson 해서 StoreDto 객체로
    );
  }

  @override
  Future<Response<StoreDto?>> deleteStore(int code) async {
    final response = await _client.delete(Uri.parse(baseUrl));

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }
  // 제네릭 타입으로 void가 들어온 경우 body에서 null을 리턴하는 것을 유일하게 허락한다

  @override
  Future<Response<StoreDto>> getStore(int code) async {
    final response = await _client.get(Uri.parse(baseUrl));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<List<StoreDto>>> getStores() async {
    final response = await _client.get(Uri.parse(baseUrl));

    // json 문자열을 Map<String, dynamic> 으로 파싱
    final decoded = jsonDecode(response.body);

    //
    final storeList = decoded['stores'];

    if (storeList is List) {
      return Response(
        statusCode: response.statusCode,
        header: response.headers,
        body: storeList.map((e) => StoreDto.fromJson(e)).toList(),
      );
    } else {
      throw Exception('response format is not a List');
    }
  }

  @override
  Future<Response<StoreDto>> patchStore(int code, StoreDto store) async {
    final response = await _client.get(Uri.parse(baseUrl));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<StoreDto>> updateStore(int id, StoreDto store) async {
    final response = await _client.get(Uri.parse(baseUrl));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
}
