import 'package:modu_3_dart_study/assignments/dto_mapper_practice/data_source/photo/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/mapper/photo/photo_mapper.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/photo/photo.dart';

class PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepository(this._dataSource);

  Future<List<Photo>?> getPhotos() async {
    try {
      final response = await _dataSource.getPhotos();

      if (response.statusCode == 200) {
        return response.body.map((dto) => dto.toPhoto(dto)).toList();
      }

      return [];
    } catch (e) {
      Exception('photo repository error');
      return [];
    }
  }
}
