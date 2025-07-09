import 'package:modu_3_dart_study/dto_mapper/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/dto_mapper/model/photo.dart';
import 'package:modu_3_dart_study/dto_mapper/repository/photo_repository.dart';
import 'package:modu_3_dart_study/dto_mapper/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_photo_data_source_impl.dart';

void main() {
  test('PhotoRepositoryImpl Test', () async {
    // given
    final int testLength = 6;
    final int testId = 1;
    final Type testType = Type.Article;
    final String testTitle = 'This is an article';
    final String testContent = 'This is the content of the article.';
    final DateTime testCreatedAt = DateTime.utc(2020, 01, 01);

    final PhotoDataSource photoDataSource = MockPhotoDataSourceImpl();
    PhotoRepository photoRepository = PhotoRepositoryImpl(
      photoDataSource: photoDataSource,
    );

    // when
    final List<Photo> result = await photoRepository.getPhotoModel();

    // then
    expect(result.length, equals(testLength));
    expect(result.first.id, equals(testId));
    expect(result.first.type, equals(testType));
    expect(result.first.title, equals(testTitle));
    expect(result.first.content, equals(testContent));
    expect(result.first.createdAt, equals(testCreatedAt));
  });
}
