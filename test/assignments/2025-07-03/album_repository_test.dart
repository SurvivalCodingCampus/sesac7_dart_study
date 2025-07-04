import 'package:modu_3_dart_study/assignments/2025-07-03/model/album.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/album_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-03/repository/album_repository_impl.dart';
import 'package:test/test.dart';

import 'mocks/mock_album_data_source_impl.dart';

void main() {
  test('Testing AlbumRepositoryImpl with MockAlbumDataSource', () async {
    //given
    final AlbumRepository testRepo = AlbumRepositoryImpl(
      MockAlbumDataSourceImpl(),
    );

    final List<Album> results = await testRepo.getAlbums();
    final List<Album> top5Results = await testRepo.getAlbums(limit: 5);

    //when

    //then
    expect(top5Results.length, 5);
    print(top5Results);

    expect(results.length, 10);
    print(results);
  });
}
