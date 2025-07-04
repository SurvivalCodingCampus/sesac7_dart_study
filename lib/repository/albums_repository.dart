
import 'package:modu_3_dart_study/model/albums.dart';

abstract interface class AlbumsRepository{
  Future<List<Album>> getAlbums({int? limit});
}