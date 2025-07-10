import 'package:modu_3_dart_study/core/network_validator.dart';
import 'package:modu_3_dart_study/data_source/photo2/photo2_data_source.dart';
import 'package:modu_3_dart_study/mapper/photo2_mapper.dart';
import 'package:modu_3_dart_study/model/photo2/photo2.dart';
import 'package:modu_3_dart_study/repository/photo2/photo2_repository.dart';

class Photo2RepositoryImpl implements Photo2Repository {
  final Photo2DataSource _dataSource;
  final NetworkValidator _validator;

  Photo2RepositoryImpl({
    required Photo2DataSource dataSource,
    NetworkValidator? validator,
  }) : _dataSource = dataSource,
       _validator = validator ?? NetworkValidator();

  @override
  Future<List<Photo2>> getPhotos() async {
    try {
      final response = await _dataSource.getPhotos();

      if (!_validator.validateStatusCode(response.statusCode)) {
        return [];
      }

      return response.body.map((dto) => dto.toModel()).toList();
    } catch (e) {
      return [];
    }
  }
}
