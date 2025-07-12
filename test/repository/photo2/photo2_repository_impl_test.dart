import 'package:modu_3_dart_study/core/network_validator_impl.dart';
import 'package:modu_3_dart_study/data_source/photo2/photo2_data_source.dart';
import 'package:modu_3_dart_study/dto/photo2/photo2_dto.dart';
import 'package:modu_3_dart_study/mapper/photo2_mapper.dart';
import 'package:modu_3_dart_study/repository/photo2/photo2_repository.dart';
import 'package:modu_3_dart_study/repository/photo2/photo2_repository_impl.dart';
import 'package:test/test.dart';

import '../../mocks/mock_photo2_data_source_impl.dart';

void main() {
  final Photo2DataSource dataSource = MockPhoto2DataSourceImpl();
  final Photo2Repository repository = Photo2RepositoryImpl(
    dataSource: dataSource,
    validator: NetworkValidatorImpl(),
  );

  group(
    'getPhotos',
    () {
      test(
        'All of the data in the Mock object is converted so that the list has six values.',
        () async {
          // given
          final expectedLength = 6;

          // when
          final photos = await repository.getPhotos();

          // then
          expect(photos.length, expectedLength);
        },
      );

      test(
        'If the data is normal, it returns a normal model.',
        () async {
          // given
          final json = {
            "id": 1,
            "type": "article",
            "title": "This is an article",
            "content": "This is the content of the article.",
            "created_at": "2020-01-01",
          };
          final expectedStore = Photo2Dto.fromJson(json).toModel();

          // when
          final photos = await repository.getPhotos();

          // then
          expect(photos.first, expectedStore);
        },
      );

      test(
        'Returns an empty list if the statusCode is not in the 200s.',
        () async {
          // given
          final expectedResult = [];
          final Photo2DataSource dataSource = MockPhoto2DataSourceImpl(
            statusCode: 404,
          );
          final Photo2Repository repository = Photo2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final photos = await repository.getPhotos();

          // then
          expect(photos, expectedResult);
        },
      );

      test(
        'Returns an empty list if the DataSource throws an exception.',
        () async {
          // given
          final expectedResult = [];
          final Photo2DataSource dataSource = MockPhoto2DataSourceImpl(
            isException: true,
          );
          final Photo2Repository repository = Photo2RepositoryImpl(
            dataSource: dataSource,
            validator: NetworkValidatorImpl(),
          );

          // when
          final photos = await repository.getPhotos();

          // then
          expect(photos, expectedResult);
        },
      );
    },
  );
}
