import 'package:modu_3_dart_study/data_source/media/media_data_source.dart';
import 'package:modu_3_dart_study/dto/media_dto.dart';
import 'package:modu_3_dart_study/mapper/media_mapper.dart';
import 'package:modu_3_dart_study/model/media.dart';
import 'package:modu_3_dart_study/repository/media/media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaDataSource _dataSource;

  MediaRepositoryImpl({required MediaDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Media>> getMediaList() async {
    final List<MediaDto> mediaDtoList = await _dataSource.getMediaList();
    return mediaDtoList.map((mediaDto) => mediaDto.toModel()).toList();
  }
}
