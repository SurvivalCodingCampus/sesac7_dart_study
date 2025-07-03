import 'package:modu_3_dart_study/20250703/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/20250703/repository/photo_repository.dart';
import 'package:modu_3_dart_study/20250703/repository/photo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../mocks/mock_photo_data_source_impl.dart';

void main() {
  test('comment_repository_impl_test', () async {
    final PhotoDataSource mockDataSource = MockPhotoDataSourceImpl();
    final PhotoRepository repository = PhotoRepositoryImpl(mockDataSource);

    final photos = await repository.getPhotos(1);
    expect(photos.length, 3);
    expect(photos.first.title, 'accusamus beatae ad facilis cum similique qui sunt');

  });
}