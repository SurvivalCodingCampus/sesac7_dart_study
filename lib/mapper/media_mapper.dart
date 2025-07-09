import 'package:modu_3_dart_study/dto/media_dto.dart';
import 'package:modu_3_dart_study/enum/media_type.dart';
import 'package:modu_3_dart_study/model/media.dart';

extension MediaDtoToModel on MediaDto {
  Media toModel() {
    final int parseId;
    final MediaType parseType;

    if (id is num) {
      parseId = id;
    } else if (id is String) {
      parseId = int.tryParse(id) ?? -1;
    } else {
      parseId = -1;
    }

    if (type == null) {
      parseType = MediaType.Unknown;
    } else {
      parseType = MediaType.values.singleWhere(
        (mediaType) => mediaType.value == type,
      );
    }

    return Media(
      id: parseId,
      type: parseType,
      title: title ?? '',
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: DateTime.tryParse(createdAt ?? '') ?? DateTime(0),
    );
  }
}

extension MediaModelToDto on Media {
  MediaDto toDto() {
    return MediaDto(
      id: id,
      type: type.value,
      title: title,
      content: content,
      url: url,
      caption: caption,
      createdAt: createdAt.toString(),
    );
  }
}
