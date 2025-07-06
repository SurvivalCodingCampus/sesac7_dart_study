import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/post/post_data_source.dart';
import 'package:modu_3_dart_study/data_source/post/post_data_source_impl.dart';
import 'package:modu_3_dart_study/model/post.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final List<Map<String, dynamic>> getPostsMockResponse = [
    {
      'userId': 1,
      'id': 1,
      'title':
          'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
      'body':
          'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
    },
    {
      'userId': 1,
      'id': 2,
      'title': 'qui est esse',
      'body':
          'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla',
    },
    {
      'userId': 1,
      'id': 3,
      'title': 'ea molestias quasi exercitationem repellat qui ipsa sit aut',
      'body':
          'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut',
    },
    {
      'userId': 1,
      'id': 4,
      'title': 'eum et est occaecati',
      'body':
          'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit',
    },
  ];

  final Map<String, dynamic> getPostMockResponse = {
    'userId': 1,
    'id': 1,
    'title':
        'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
    'body':
        'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
  };

  final int testUserId = 100;
  final int testId = 10;
  final String testTitle = 'createTestTitle';
  final String testBody = 'createTestBody';
  final Map<String, dynamic> createPostMockResponse = {
    'userId': testUserId,
    'id': testId,
    'title': testTitle,
    'body': testBody,
  };

  final int testUpdateId = 10;
  final String testUpdateTitle = 'updateTestTitle';
  final String testUpdateBody = 'updateTestBody';
  final Map<String, dynamic> updatePostMockResponse = {
    'id': testUpdateId,
    'title': testUpdateTitle,
    'body': testUpdateBody,
  };

  final int testPatchUserId = 100;
  final int testPatchId = 10;
  final String testPatchTitle = 'patchTestTitle';
  final String testPatchBody = 'patchTestBody';
  final Map<String, dynamic> patchPostMockResponse = {
    'userId': testPatchUserId,
    'id': testPatchId,
    'title': testPatchTitle,
    'body': testPatchBody,
  };

  group('PostDataSourceImplTest', () {
    test('getPosts Test', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(jsonEncode(getPostsMockResponse), 200);
      });
      final PostDataSource postDataSource = PostDataSourceImpl(mockClient);
      final Response<List<Map<String, dynamic>>> postsResponse =
          await postDataSource.getPosts();
      final List<Post> posts = postsResponse.body
          .map((post) => Post.fromJson(post))
          .toList();

      expect(postsResponse.statusCode, equals(200)); // 200 성공
      expect(posts.length, equals(4)); //
      expect(posts.first.userId, equals(1));
      expect(posts.first.id, equals(1));
      expect(
        posts.first.title,
        equals(
          'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
        ),
      );
      expect(
        posts.first.body,
        equals(
          'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
        ),
      );
    });
    test('getPost Test', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(jsonEncode(getPostMockResponse), 200);
      });
      final PostDataSource postDataSource = PostDataSourceImpl(mockClient);
      final Response<Map<String, dynamic>> postResponse = await postDataSource
          .getPost(1);
      final Post postIdOne = Post.fromJson(postResponse.body);

      expect(postResponse.statusCode, equals(200));
      expect(postIdOne.userId, equals(1));
      expect(postIdOne.id, equals(1));
      expect(
        postIdOne.title,
        equals(
          'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
        ),
      );
      expect(
        postIdOne.body,
        equals(
          'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
        ),
      );
    });
    test('createPost Test', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(jsonEncode(createPostMockResponse), 201);
      });
      final PostDataSource postDataSource = PostDataSourceImpl(mockClient);
      final Map<String, dynamic> testPost = {
        'userId': testUserId,
        'id': testId,
        'title': testTitle,
        'body': testBody,
      };
      final Response<Map<String, dynamic>> createResponse = await postDataSource
          .createPost(testPost);
      final Post createPostResponseBody = Post.fromJson(createResponse.body);

      expect(createResponse.statusCode, equals(201));
      expect(createPostResponseBody.userId, equals(testUserId));
      expect(createPostResponseBody.id, equals(testId));
      expect(createPostResponseBody.title, equals(testTitle));
      expect(createPostResponseBody.body, equals(testBody));
    });
    test('updatePost Test', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(jsonEncode(updatePostMockResponse), 200);
      });
      final PostDataSource postDataSource = PostDataSourceImpl(mockClient);
      final Map<String, dynamic> testUpdatePost = {
        'title': testUpdateTitle,
        'body': testUpdateBody,
      };
      final Response<Map<String, dynamic>> updateResponse = await postDataSource
          .updatePost(testUpdateId, testUpdatePost);
      final Post updatePostResponseBody = Post.fromJson(updateResponse.body);

      expect(updateResponse.statusCode, equals(200));
      expect(updatePostResponseBody.userId, isNull);
      expect(updatePostResponseBody.id, testUpdateId);
      expect(updatePostResponseBody.title, testUpdateTitle);
      expect(updatePostResponseBody.body, testUpdateBody);
    });

    test('patchPost Test', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(jsonEncode(patchPostMockResponse), 200);
      });
      final PostDataSource postDataSource = PostDataSourceImpl(mockClient);
      final Map<String, dynamic> testPatchPost = {'body': testPatchBody};
      final Response<Map<String, dynamic>> patchResponse = await postDataSource
          .patchPost(testPatchId, testPatchPost);
      final Post patchPostResponseBody = Post.fromJson(patchResponse.body);

      expect(patchResponse.statusCode, 200);
      expect(patchPostResponseBody.userId, equals(testPatchUserId));
      expect(patchPostResponseBody.id, equals(testPatchId));
      expect(patchPostResponseBody.title, equals(testPatchTitle));
      expect(patchPostResponseBody.body, equals(testPatchBody));
    });

    test('deletePost Test', () async {
      final MockClient mockClient = MockClient((request) async {
        return http.Response(jsonEncode({}), 200);
      });
      final PostDataSource postDataSource = PostDataSourceImpl(mockClient);
      final Response<void> deleteResponse = await postDataSource.deletePost(10);

      expect(deleteResponse.statusCode, 200);
    });
  });
}
