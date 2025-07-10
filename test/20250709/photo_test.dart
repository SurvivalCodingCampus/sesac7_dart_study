import 'package:modu_3_dart_study/20250709/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/20250709/repository/photo_repository.dart';
import 'package:modu_3_dart_study/20250709/repository/photo_repository_impl.dart';
import 'package:modu_3_dart_study/20250709/model/photo.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'mock_photo_data_source_impl.dart';

void main() {
  test('포토 Mock 데이터 테스트', () async {

    final PhotoDataSource mockDataSource = MockPhotoDataSourceImpl();
    final PhotoRepository repository = PhotoRepositoryImpl(mockDataSource);

    final storeList = await repository.getPhoto();

    expect(storeList.length, 6);
    expect(storeList[2].type, Type.Video);
  });
}