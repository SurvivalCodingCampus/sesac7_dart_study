import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-07-04/core/res.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-04/data_source/remote_data_source.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final RemoteDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotoByKeyword(String keyword) async {
    final Res<String> res = await _dataSource.getPhotos();
    if (res.statusCode != 200) {
      throw Exception("ERROR");
    }

    final List decodedBody = jsonDecode(res.body);

    return decodedBody
        .map((e) => Photo.fromJson(e))
        .where((p) => p.title.contains(keyword))
        .toList();
  }
}
/*
void main() async {
  PhotoRepository repo = PhotoRepositoryImpl(JsonPlaceholderSourceImpl());
  final result = await repo.getPhotoByKeyword('officia');
  print(result);
}
*/