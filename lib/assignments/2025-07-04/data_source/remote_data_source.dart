import 'package:modu_3_dart_study/assignments/2025-07-04/core/res.dart';

abstract interface class RemoteDataSource {
  Future<Res<String>> getPhotos();
  Future<Res<String>> getPhoto(int id);
  Future<Res<String>> createPhoto(Map<String, dynamic> mapOfPhoto);
  Future<Res<String>> updatePhoto(int id, Map<String, dynamic> mapOfPhoto);
  Future<Res<String>> patchPhoto(int id, Map<String, dynamic> mapOfPhoto);
  Future<Res<String>> deletePhoto(int id);
}
