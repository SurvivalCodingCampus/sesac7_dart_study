import 'package:modu_3_dart_study/model/albums.dart';
import 'package:modu_3_dart_study/repository/albums_repository.dart';
import 'package:modu_3_dart_study/data_source/local/data_source.dart';

class AlbumsRepositoryImpl implements AlbumsRepository{

  final DataSource _dataSource;
  AlbumsRepositoryImpl(this._dataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final results = await _dataSource.getAll();
    final allResults = results.map((e) => Album.fromJson(e)).toList();

    if( limit == null ) {
      return allResults;
    } else if ( limit > allResults.length) {
      return allResults;
    } else {
      return allResults
        .sublist(0, limit);
    }    
  }  
}