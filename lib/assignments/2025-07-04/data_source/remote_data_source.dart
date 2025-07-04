import 'package:modu_3_dart_study/assignments/2025-07-04/core/res.dart';

abstract interface class RemoteDataSource {
  Future<Res> getPhotos();
  Future<Res> getPhoto(int id);
  Future<Res> createPhoto(Map<String, dynamic> mapOfPhoto);
  Future<Res> updatePhoto(int id, Map<String, dynamic> mapOfPhoto);
  Future<Res> patchPhoto(int id, Map<String, dynamic> mapOfPhoto);
  Future<Res> deletePhoto(int id);
}
