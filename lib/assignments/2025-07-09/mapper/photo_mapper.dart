import 'package:intl/intl.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/photo_type.dart';

extension DtoToPhoto on PhotoDTO {
  Photo toPhoto() {
    final int idHolder = (id == null) ? -1 : id!;

    final PhotoType typeHolder;
    if (type == null) {
      typeHolder = PhotoType.unknown;
    } else if (type!.toLowerCase() == 'article') {
      typeHolder = PhotoType.article;
    } else if (type!.toLowerCase() == 'video') {
      typeHolder = PhotoType.video;
    } else if (type!.toLowerCase() == 'image') {
      typeHolder = PhotoType.image;
    } else {
      typeHolder = PhotoType.unknown;
    }

    final DateTime createdAtHolder =
        ((createdAt == null) || DateTime.tryParse(createdAt!) == null)
        ? DateTime(0, 1, 1)
        : DateTime.tryParse(createdAt!)!;

    return Photo(
      id: idHolder,
      type: typeHolder,
      createdAt: createdAtHolder,
      title: title,
      url: url,
      content: content,
      caption: caption,
    );
  }
}

extension PhotoToDto on Photo {
  PhotoDTO toPhotoDto() {
    return PhotoDTO(
      id: id,
      type: type.name,
      title: title,
      url: url,
      content: content,
      caption: caption,
      createdAt: DateFormat("yyyy-MM-dd").format(createdAt),
    );
  }
}
