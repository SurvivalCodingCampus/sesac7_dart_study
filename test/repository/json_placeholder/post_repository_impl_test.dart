import 'package:modu_3_dart_study/data_source/json_placeholder/post_data_source.dart';
import 'package:modu_3_dart_study/repository/json_placeholder/post_repository.dart';
import 'package:modu_3_dart_study/repository/json_placeholder/post_repository_impl.dart';
import 'package:test/test.dart';

import '../../mocks/mock_post_data_source_impl.dart';

void main() {
  final PostDataSource dataSource = MockPostDataSourceImpl();
  final PostRepository repository = PostRepositoryImpl(dataSource: dataSource);

  group(
    'getPostsByKeyword',
    () {
      test('If the keyword is sunt, the list contains 1 value.', () async {
        // given
        final keyword = 'sunt';
        final expectedLength = 1;

        // when
        final posts = await repository.getPostsByKeyword(keyword);

        // then
        expect(posts.length, expectedLength);
      });

      test(
        'If the keyword is sunt, then the title of all values will contain sunt.',
        () async {
          // given
          final keyword = 'sunt';

          // when
          final posts = await repository.getPostsByKeyword(keyword);

          // then
          for (var post in posts) {
            expect(post.title.contains(keyword), isTrue);
          }
        },
      );

      test(
        'If all values have no keyword in title, the list has 0 values.',
        () async {
          // given
          final keyword = 'zzzzzz';
          final expectedLength = 0;

          // when
          final posts = await repository.getPostsByKeyword(keyword);

          // then
          expect(posts.length, expectedLength);
        },
      );

      test(
        'Returns an empty list if the statusCode is not in the 200s.',
        () async {
          // given
          final keyword = 'zzzzzz';
          final expectedLength = 0;
          final PostDataSource dataSource = MockPostDataSourceImpl(
            isFail: true,
          );
          final PostRepository repository = PostRepositoryImpl(
            dataSource: dataSource,
          );

          // when
          final posts = await repository.getPostsByKeyword(keyword);

          // then
          expect(posts.length, expectedLength);
        },
      );
    },
  );
}
