// 서버는 절대 완벽한 데이터를 주지않는다.
// Resoponse 값이 null 이라면
// 1.원래 fromJson으로 변경하고 null 대응 title = json['title'] ?? ''
// 2.어노테이션 사용  @JsonKey(defaultValue: '')
// 3.try catch 사용

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/18_http/constants/http_env.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/18_http/data_source/remote_data_source_impl.dart';
import 'package:modu_3_dart_study/18_http/model/post.dart';
import 'package:test/test.dart';

void main() {
  group('create', () {
    test('createPost 테스트', () async {
      //given(준비)
      MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({
            'userId': 1,
            'id': 4,
            'title': 'create test',
            'body': 'test4 body',
          }),
          201,
        );
      });

      RemoteDataSource dataSource = RemoteDataSourceImpl(client: mockClient);

      //when(실행)
      // 서버에 보내는 Post
      final response = await dataSource.createPost(
        Post(
          userId: 1,
          id: 0,
          title: 'create test',
          body: 'test body',
        ),
      );

      //then(검증)
      expect(response.statusCode, 201);
      expect(response.body.id, 4);
      expect(response.body.body, 'test4 body');
    });
  });

  group('Read Test', () {
    test('getPost 테스트', () async {
      //given(준비)
      // MockClient : http 패키지의 테스트용 클래스
      // A mock HTTP client designed for use when testing code that uses BaseClient.
      MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({
            'userId': 1,
            'id': 1,
            'title': 'test',
            'body': 'test body',
          }),
          200,
        );
      });

      RemoteDataSource dataSource = RemoteDataSourceImpl(client: mockClient);

      //when(실행)
      final response = await dataSource.getPost(1);

      //then(검증)
      expect(response.statusCode, 200);
      expect(response.body.title, 'test');
    });

    test('getPosts 테스트', () async {
      //given(준비)
      MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode([
            {
              'userId': 1,
              'id': 1,
              'title': 'test1',
              'body': 'test1 body',
            },
            {
              'userId': 2,
              'id': 2,
              'title': 'test2',
              'body': 'test2 body',
            },
            {
              'userId': 3,
              'id': 3,
              'title': 'test3',
              'body': 'test3 body',
            },
          ]),
          200,
        );
      });

      RemoteDataSource dataSource = RemoteDataSourceImpl(client: mockClient);

      //when(실행)
      final response = await dataSource.getPosts();

      //then(검증)
      expect(response.statusCode, 200);
      expect(response.body.length, 3);
      expect(response.body[0].title, 'test1');
      expect(response.body[1].title, 'test2');
      expect(response.body[2].title, 'test3');
    });
  });

  group('update Test', () {
    test('updatePost 테스트', () async {
      //given(준비)
      //서버
      MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({
            'userId': 1,
            'id': 1,
            'title': '수정 update test',
            'body': 'test body',
          }),
          200,
          headers: HttpEnv.HEADERS,
        );
      });

      RemoteDataSource dataSource = RemoteDataSourceImpl(client: mockClient);

      //when(실행)
      final response = await dataSource.updatePost(
        1,
        Post(userId: 1, id: 1, title: 'test', body: 'update test body'),
      );

      //then(검증)
      expect(response.statusCode, 200);
      expect(response.body.title, 'update test');
    });

    test('patchPost 테스트', () async {
      //given(준비)
      MockClient mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode([
            {
              'userId': 1,
              'id': 1,
              'title': 'test1',
              'body': 'test1 body',
            },
            {
              'userId': 2,
              'id': 2,
              'title': 'test2',
              'body': 'test2 body',
            },
            {
              'userId': 3,
              'id': 3,
              'title': 'test3',
              'body': 'test3 body',
            },
          ]),
          200,
        );
      });

      RemoteDataSource dataSource = RemoteDataSourceImpl(client: mockClient);

      //when(실행)
      final response = await dataSource.getPosts();

      //then(검증)
      expect(response.statusCode, 200);
      expect(response.body.length, 3);
      expect(response.body[0].title, 'test1');
      expect(response.body[1].title, 'test2');
      expect(response.body[2].title, 'test3');
    });
  });
}
