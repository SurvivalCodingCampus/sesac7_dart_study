import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/250709/homework2/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/250709/homework2/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/250709/homework2/dto/photo_dto.dart';
import 'package:modu_3_dart_study/250709/homework2/repository/photo_repository_impl.dart';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/250709/homework2/model/photo.dart';

import 'photo_reposiory_impl_test.mocks.dart';

@GenerateMocks([PhotoDataSourceImpl])
void main() async {
  test('test', () async {
    final PhotoDataSource photoDataSource = MockPhotoDataSourceImpl();
    final photoDataRepository = PhotoRepositoryImpl(photoDataSource);

    final json = [
      {
        "id": 1,
        "type": "article",
        "title": "This is an article",
        "content": "This is the content of the article.",
        "created_at": "2020-01-01",
      },
      {
        "id": 2,
        "type": "image",
        "url": "https://example.com/image.jpg",
        "caption": "This is an image.",
        "created_at": "2020-02-02",
      },
    ];
    final photoDtoList = json.map((e) => PhotoDto.fromJson(e)).toList();

    when(photoDataSource.getPhotos()).thenAnswer((_) async => photoDtoList);

    expect((await photoDataRepository.getPhotos()).first.id, 1);
    expect((await photoDataRepository.getPhotos()).first.type, Type.Article);
  });
}
