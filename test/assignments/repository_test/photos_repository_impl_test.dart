import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/photo/photo.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/repository/photo/photo_repository_impl.dart';
import 'package:test/test.dart';

import '../mocks/mock_photos_data_resource_impl.dart';

void main() {
  group('PhotoRepository 테스트', () {
    test('Photo 리스트 반환', () async {
      final dataSource = MockPhotosDataResourceImpl();
      final repository = PhotoRepository(dataSource);

      final photoList = await repository.getPhotos();

      expect(photoList, isA<List<Photo>>());
      expect(photoList?.length, 4);
    });

    test('매핑 테스트', () async {
      final dataSource = MockPhotosDataResourceImpl();
      final repository = PhotoRepository(dataSource);

      final photoList = await repository.getPhotos();

      expect(photoList?[0].id, 1);
      expect(photoList?[0].type, PhotoType.article);
      expect(photoList?[0].createdAt, DateTime(2020, 1, 1));
    });

    test('string int 변환 테스트', () async {
      final dataSource = MockPhotosDataResourceImpl();
      final repository = PhotoRepository(dataSource);

      final photoList = await repository.getPhotos();

      expect(photoList?[1].id, 2);
      expect(photoList?[1].type, PhotoType.image);
      expect(photoList?[1].createdAt, DateTime(2020, 2, 2));
    });

    test('type이 null인 경우 PhotoType.unknown으로 매핑되어야 한다', () async {
      final dataSource = MockPhotosDataResourceImpl();
      final repository = PhotoRepository(dataSource);

      final photoList = await repository.getPhotos();

      expect(photoList?[2].type, PhotoType.invalid);
      expect(photoList?[2].createdAt, DateTime(2020, 3, 3));
    });

    test('타입 null test', () async {
      final dataSource = MockPhotosDataResourceImpl();
      final repository = PhotoRepository(dataSource);

      final photoList = await repository.getPhotos();

      expect(photoList?[3].type, PhotoType.invalid);
      expect(photoList?[3].createdAt, DateTime(2020, 4, 4));
    });
  });
}
