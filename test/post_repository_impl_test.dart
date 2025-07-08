import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/model/post.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/repository/post_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('post_repository_impl test', () async {
    final List<Post> postsByKeyword = await PostRepositoryImpl(
      JsonPlaceHolderDataSourceImpl(),
    ).getPostsByKeyword('esse');
    print(postsByKeyword.length);
    print(postsByKeyword.first.title);
  });
}
