import 'package:modu_3_dart_study/data_source/media/media_data_source.dart';
import 'package:modu_3_dart_study/enum/media_type.dart';
import 'package:modu_3_dart_study/model/media.dart';
import 'package:modu_3_dart_study/repository/media/media_repository.dart';
import 'package:modu_3_dart_study/repository/media/media_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_media_data_source_impl.dart';

void main() {
  group('MediaRepositoryImpl Test', () {
    test('getMediaList Test', () async {
      final MediaDataSource dataSource = MockMediaDataSourceImpl();
      final MediaRepository repository = MediaRepositoryImpl(
        dataSource: dataSource,
      );
      final List<Media> mediaList = await repository.getMediaList();
      final Media firstMediaItem = mediaList.first;

      expect(firstMediaItem.id, equals(1));
      expect(firstMediaItem.type, equals(MediaType.Article));
      expect(firstMediaItem.title, equals('This is an article'));
      expect(firstMediaItem.content, equals('This is the content of the article.'));
      expect(firstMediaItem.createdAt, equals(DateTime.tryParse('2020-01-01')));
    });

    test('getMediaList empty field Test', () async {
      final MediaDataSource dataSource = MockMediaDataSourceImpl();
      final MediaRepository repository = MediaRepositoryImpl(
        dataSource: dataSource,
      );
      final List<Media> mediaList = await repository.getMediaList();

      expect(mediaList[0].url, equals(''));
      expect(mediaList[0].caption, equals(''));
      expect(mediaList[1].title, equals(''));
      expect(mediaList[1].content, equals(''));
      expect(mediaList[2].title, equals(''));
      expect(mediaList[2].content, equals(''));
      expect(mediaList[3].url, equals(''));
      expect(mediaList[3].caption, equals(''));
      expect(mediaList[4].title, equals(''));
      expect(mediaList[4].content, equals(''));
      expect(mediaList[5].type, equals(MediaType.Unknown));
      expect(mediaList[5].title, equals(''));
      expect(mediaList[5].content, equals(''));
    });

    test('getMediaList id field String 타입 int 파싱 Test', () async {
      final MediaDataSource dataSource = MockMediaDataSourceImpl();
      final MediaRepository repository = MediaRepositoryImpl(
        dataSource: dataSource,
      );
      final List<Media> mediaList = await repository.getMediaList();

      expect(mediaList[3].id, equals(4));
    });

    test('getMediaList type field null 파싱 기본값 unknown type Test', () async {
      final MediaDataSource dataSource = MockMediaDataSourceImpl();
      final MediaRepository repository = MediaRepositoryImpl(
        dataSource: dataSource,
      );
      final List<Media> mediaList = await repository.getMediaList();

      expect(mediaList[4].type, equals(MediaType.Unknown));
    });

    test('getMediaList create_at field DateTime 파싱 Test', () async {
      final MediaDataSource dataSource = MockMediaDataSourceImpl();
      final MediaRepository repository = MediaRepositoryImpl(
        dataSource: dataSource,
      );
      final List<Media> mediaList = await repository.getMediaList();

      expect(mediaList[0].createdAt, isA<DateTime>());
    });
  });
}
