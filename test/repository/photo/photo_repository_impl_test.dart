import 'package:modu_3_dart_study/data_source/photo/photo_data_source.dart';
import 'package:modu_3_dart_study/repository/photo/photo_repository.dart';
import 'package:modu_3_dart_study/repository/photo/photo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_photo_data_source_impl.dart';

void main() {
  test('PhotoRepositoryImpl Test', () async {
    final PhotoDataSource mockPhotoDataSource = MockPhotoDataSourceImpl();
    final PhotoRepository photoRepository = PhotoRepositoryImpl(dataSource: mockPhotoDataSource);

    expect((await photoRepository.getPhotos(0)).length, equals(0));
    expect((await photoRepository.getPhotos(1)).length, equals(2));
    expect((await photoRepository.getPhotos(2)).length, equals(1));
    expect((await photoRepository.getPhotos(1)).first.url, equals('https://via.placeholder.com/600/92c952'));
  });
}