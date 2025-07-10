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
    final int testId1 = 1;
    final int testId2 = 6;
    final Type testType1 = Type.Article;
    final Type testType2 = Type.Unknown;
    final String testTitle1 = 'This is an article';
    final String testTitle2 = 'unknown';
    final String testUrl1 = 'unknown';
    final String testUrl2 = 'https://example.com/video.mp4';
    final String testCaption1 = 'unknown';
    final String testCaption2 = 'This is a video.';
    final String testContent1 = 'This is the content of the article.';
    final String testContent2 = 'unknown';
    final DateTime testCreatedAt1 = DateTime.utc(2020, 01, 01);
    final DateTime testCreatedAt2 = DateTime.utc(2020, 03, 03);

    final PhotoDataSource photoDataSource = MockPhotoDataSourceImpl();
    PhotoRepository photoRepository = PhotoRepositoryImpl(
      photoDataSource: photoDataSource,
    );

    // when
    final List<Photo> result = await photoRepository.getPhotoModel();

    // then
    expect(result.length, equals(testLength));
    expect(result.first.id, equals(testId1));
    expect(result.first.type, equals(testType1));
    expect(result.first.title, equals(testTitle1));
    expect(result.first.url, equals(testUrl1));
    expect(result.first.caption, equals(testCaption1));
    expect(result.first.content, equals(testContent1));
    expect(result.first.createdAt, equals(testCreatedAt1));

    expect(result.last.id, equals(testId2));
    expect(result.last.type, equals(testType2));
    expect(result.last.title, equals(testTitle2));
    expect(result.last.url, equals(testUrl2));
    expect(result.last.caption, equals(testCaption2));
    expect(result.last.content, equals(testContent2));
    expect(result.last.createdAt, equals(testCreatedAt2));
  });
}
