import 'package:modu_3_dart_study/model/media.dart';

abstract interface class MediaRepository {
  Future<List<Media>> getMediaList();
}