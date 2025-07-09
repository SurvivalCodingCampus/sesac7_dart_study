import 'package:modu_3_dart_study/17_dto_mapper/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/17_dto_mapper/media_type.dart';
import 'package:modu_3_dart_study/17_dto_mapper/repository/photo_repository.dart';
import 'package:modu_3_dart_study/17_dto_mapper/repository/photo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_photo_data_source_impl2.dart';

void main() {
  test('PhotoRepositoryImpl, getPhotos() Test', () async {
    final PhotoDataSource dataSource = MockPhotoDataSourceImpl();
    final PhotoRepository repository = PhotoRepositoryImpl(dataSource);

    final photos = await repository.getPhotos();

    expect(photos.length, 5);
    expect(photos.first.createdAt.runtimeType, DateTime);
    expect(photos.first.url, 'null');
    expect(photos.first.caption, 'null');
    expect(photos[1].title, 'null');
    expect(photos[1].content, 'null');
    expect(photos[2].id, -1);
    expect(photos[3].type, MediaType.unknown);
    expect(photos[3].caption, 'null');
    expect(photos[4].type, MediaType.unknown);
    expect(photos[4].title, 'null');
  });
}
