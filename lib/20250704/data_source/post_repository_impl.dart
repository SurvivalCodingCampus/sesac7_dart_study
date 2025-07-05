import 'dart:convert';

import 'package:modu_3_dart_study/20250704/data_source/remote_data_source.dart';
import 'package:modu_3_dart_study/20250704/data_source/remote_data_source_impl.dart';
import 'package:modu_3_dart_study/20250704/model/post.dart';

class PostRepositoryImpl {
  final RemoteDataSource remoteDataSource;

  const PostRepositoryImpl({required this.remoteDataSource});

  Future<List<Map<String, dynamic>>> getPostsByKeyword(String keyword) async {
    try {
      final allPostData = await remoteDataSource.getPosts();
      final mapPostData = jsonDecode(allPostData.body);

      final data = List<Map<String, dynamic>>.from(
        mapPostData,
      ).where((e) => e['title'].contains(keyword)).toList();

      return data;
    } catch (e) {
     print('error : ${e.toString()}');
     return [];
    }
  }
}
