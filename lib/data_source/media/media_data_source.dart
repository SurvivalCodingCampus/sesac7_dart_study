import 'package:modu_3_dart_study/dto/media_dto.dart';

abstract interface class MediaDataSource {
  Future<List<MediaDto>> getMediaList();
}