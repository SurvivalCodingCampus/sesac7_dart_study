import 'package:modu_3_dart_study/model/model_photo.dart';

abstract interface class ModelPhotoRepository {
  Future<List<ModelPhoto>> getPhotos();
}
