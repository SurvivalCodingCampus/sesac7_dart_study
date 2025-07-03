import 'package:modu_3_dart_study/repository/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/repository/repository/photo_repository.dart';
import 'package:modu_3_dart_study/repository/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_photo_repository_impl.dart';

void main() {
  test('Repository 작성 연습 2 test', () async {
    //given(준비)
    final String title1 = 'accusamus beatae ad facilis cum similique qui sunt';
    final int totalnum = 50;
    final PhotoDataSource photoDataSource = MockPhotoRepositoryImpl();
    final PhotoRepository repository = PhotoRepositoryImpl(photoDataSource);

    //when(실행)
    final photo = await repository.getPhotos(1);

    //then(검증)
    expect(photo.first.title, title1);
    expect(photo.length, totalnum);
  });
}
