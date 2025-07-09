import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/data_source/post/post_data_source.dart';
import 'package:modu_3_dart_study/data_source/post/post_data_source_impl.dart';
import 'package:modu_3_dart_study/model/post.dart';
import 'package:modu_3_dart_study/repository/post/post_repository.dart';
import 'package:modu_3_dart_study/repository/post/post_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final String keyword = 'PGT';
  final List<Map<String, dynamic>> getPostsMockResponse = [
    {
      'userId': 1,
      'id': 1,
      'title':
          'sunt aut facere repellat provident occaecati excepturi optio reprehenderit $keyword',
      'body':
          'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
    },
    {
      'userId': 4,
      'id': 2,
      'title': 'qui est esse',
      'body':
          'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla',
    },
    {
      'userId': 7,
      'id': 3,
      'title':
          'ea molestias quasi exercitationem repellat qui ipsa sit aut $keyword',
      'body':
          'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut',
    },
    {
      'userId': 8,
      'id': 4,
      'title': 'eum et est occaecati',
      'body':
          'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit',
    },
  ];
  final MockClient mockClient = MockClient((request) async {
    return http.Response(jsonEncode(getPostsMockResponse), 200);
  });
  final PostDataSource dataSource = PostDataSourceImpl(mockClient);
  final PostRepository postRepository = PostRepositoryImpl(dataSource);

  group('PostRepositoryImpl Test', () {
    test('getPostsByKeyword keyword가 있는 list 결고 검증', () async {
      final List<Post> postsByKeyword = await postRepository.getPostsByKeyword(
        keyword,
      );

      expect(postsByKeyword.length, 2);
      for (int i = 0; i < postsByKeyword.length; i++) {
        expect(postsByKeyword[i].title?.contains(keyword), isTrue);
      }
    });
    test('getPostsByKeyword keyword가 없는 list 결과 검증', () async {
      final List<Post> postsByKeyword = await postRepository.getPostsByKeyword(
        '박기택',
      );

      expect(postsByKeyword.isEmpty, isTrue);
    });
    test('getPostsByKeyword keyword 대소문자 상관없이 결과 반영되는지 확인', () async {
      final List<Post> postsByKeyword = await postRepository.getPostsByKeyword(
        keyword.toLowerCase(),
      );

      expect(postsByKeyword.length, 2);
      for (int i = 0; i < postsByKeyword.length; i++) {
        expect(postsByKeyword[i].title?.contains(keyword), isTrue);
      }
    });
  });
}
