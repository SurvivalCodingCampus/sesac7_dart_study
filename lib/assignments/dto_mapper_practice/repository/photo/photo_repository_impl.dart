import 'package:modu_3_dart_study/assignments/dto_mapper_practice/data_source/photo/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/mapper/photo/photo_mapper.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/photo/photo.dart';

class PhotoRepository {
  final PhotoDataSource _dataSource;
  final PhotoMapper _mapper;

  PhotoRepository(this._dataSource, this._mapper);

  Future<List<Photo>> getPhotos() async {
    try {
      final response = await _dataSource.getPhotos();

      if (response.statusCode == 200) {
        return response.body.map((dto) => _mapper.toPhoto(dto)).toList();
      }

      return [];
    } catch (e) {
      Exception('photo repository error');
      return [];
    }
  }
}
