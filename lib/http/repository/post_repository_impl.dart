import 'package:modu_3_dart_study/http/data_source/json_place_holder_data_source_impl.dart';
import 'package:modu_3_dart_study/http/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/http/model/post.dart';
import 'package:modu_3_dart_study/http/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource _remoteDataSource;

  const PostRepositoryImpl({
    required RemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<Post>> getPostsByKeyword(String keyword) async {
    // 내가 만든 Response를 반환
    final response = await _remoteDataSource.getPosts();

    if (response.statusCode != 200) {
      throw Exception('실패');
    }

    // getPosts()를 실행할 때 body에 들어가는 값은 jsonDecode 과정을 이미 거쳤다.
    // http.get으로 불러온 String을 디코딩한 리스트가 body에 저장되어있음.
    return response.body
        .map((e) => Post.fromJson(e))
        .where((post) => post.title.toLowerCase().contains(keyword))
        .toList();
  }
}

void main() async {
  PostRepository a = PostRepositoryImpl(
    remoteDataSource: JsonPlaceHolderDataSourceImpl(),
  );
  final List<Post> b = await a.getPostsByKeyword('sunt');
  print(b[1].toJson());
}
