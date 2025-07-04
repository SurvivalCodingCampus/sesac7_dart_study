import 'package:modu_3_dart_study/data_source/comment_data_source.dart';

class MockCommentDataSourceImpl implements CommentDataSource {
  final jsons = [
    {
      "postId": 1,
      "id": 1,
      "name": "id labore ex et quam laborum",
      "email": "Eliseo@gardner.biz",
      "body":
          "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo necessitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium",
    },
    {
      "postId": 2,
      "id": 2,
      "name": "quo vero reiciendis velit similique earum",
      "email": "Jayne_Kuhic@sydney.com",
      "body":
          "est natus enim nihil est dolore omnis voluptatem numquam et omnis occaecati quod ullam at voluptatem error expedita pariatur nihil sint nostrum voluptatem reiciendis et",
    },
  ];
  final bool? isException;

  MockCommentDataSourceImpl({this.isException});

  @override
  Future<List<Map<String, dynamic>>> getComments() async {
    if (isException != null && isException!) {
      throw Exception('Fail to get comments');
    }

    return jsons;
  }
}
