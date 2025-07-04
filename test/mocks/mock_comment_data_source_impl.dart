import 'package:modu_3_dart_study/data_source/local/comment_data_source.dart';

class MockCommentDataSourceImpl implements CommentDataSource {
  
  final List<Map<String, dynamic>> json;

  // 생성자로 외부에서 값을 넣을 수 있게 변경함
  MockCommentDataSourceImpl(this.json);
  
  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    return json;
  }

  
}
