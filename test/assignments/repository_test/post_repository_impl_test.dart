import 'package:modu_3_dart_study/assignments/http_practice/data_source/json_place_holder_data_resource_impl.dart';
import 'package:test/test.dart';

void main() {
  test('api 호출 테스트 ', () async {
    final dataSource = JsonPlaceHolderDataSourceImpl();

    final response = await dataSource.getPost(postId: 1);

    expect(response.statusCode, 200);
  });

  test('api 호출 실패 404 테스트', () async {
    final dataSource = JsonPlaceHolderDataSourceImpl();
    final response = await dataSource.getPost(postId: 9999);

    expect(response.statusCode, 404);
  });
}
