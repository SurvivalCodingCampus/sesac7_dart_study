import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/250704/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/250704/data_source/remote_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  test('getPost', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(
          {
            'userId': 10,
            'id': 100,
            'title': 'title 10 100',
            'body': 'body 10 100',
          },
        ),
        200,
      );
    });

    final RemoteDataSource dataSource = RemoteDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.getPost(id: 1);
    expect(response.statusCode, 200);
  });

  test('getPosts', () async {
    final json = [
      {
        "userId": 1,
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      },
      {
        "userId": 1,
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      },
      {
        "userId": 1,
        "id": 2,
        "title": "qui est esse",
        "body":
            "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
      },
      {
        "userId": 1,
        "id": 3,
        "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
        "body":
            "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
      },
      {
        "userId": 1,
        "id": 4,
        "title": "eum et est occaecati",
        "body":
            "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit",
      },
      {
        "userId": 1,
        "id": 5,
        "title": "nesciunt quas odio",
        "body":
            "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque",
      },
    ];
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(json),
        200,
      );
    });

    final RemoteDataSource dataSource = RemoteDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.getPosts();

    expect(response.statusCode, 200);
  });

  test('createPost', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(
          {
            'userId': 10,
            'id': 100,
            'title': 'title 10 100',
            'body': 'body 10 100',
          },
        ),
        200,
      );
    });

    final RemoteDataSource dataSource = RemoteDataSourceImpl(
      client: mockClient,
    );

    final post = {
      'userId': 10,
      'id': 100,
      'title': 'title 10 100',
      'body': 'body 10 100',
    };

    final response = await dataSource.createPost(post: post);
    expect(response.statusCode, 200);
  });

  test('updatePost', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(
          {
            'userId': 10,
            'id': 100,
            'title': 'title 10 100',
            'body': 'body 10 100',
          },
        ),
        200,
      );
    });

    final RemoteDataSource dataSource = RemoteDataSourceImpl(
      client: mockClient,
    );

    final post = {
      'title': 'title 10 100',
      'body': 'body 10 100',
    };

    final response = await dataSource.updatePost(id: 100, post: post);
    expect(response.statusCode, 200);
  });

  test('deletePost', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        '',
        200,
      );
    });

    final RemoteDataSource dataSource = RemoteDataSourceImpl(
      client: mockClient,
    );

    final response = await dataSource.deletePost(id: 100);
    expect(response.statusCode, 200);
  });

  test('patchPost', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode(
          {
            'userId': 10,
            'id': 100,
            'title': 'title 10 100',
            'body': 'body 10 100',
          },
        ),
        200,
      );
    });

    final RemoteDataSource dataSource = RemoteDataSourceImpl(
      client: mockClient,
    );

    final post = {
      'title': 'title 10 100',
      'body': 'body 10 100',
    };

    final response = await dataSource.patchPost(id: 100, post: post);
    expect(response.statusCode, 200);
  });
}
