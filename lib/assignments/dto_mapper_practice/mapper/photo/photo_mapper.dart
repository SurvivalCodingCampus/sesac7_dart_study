import 'package:modu_3_dart_study/assignments/dto_mapper_practice/dto/photo/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/dto_mapper_practice/model/photo/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto(PhotoDto dto) {
    DateTime createdAt;
    final int id = int.tryParse(dto.id.toString()) ?? 0;
    try {
      createdAt = DateTime.parse(dto.createdAt ?? '');
    } catch (e) {
      createdAt = DateTime(2000, 1, 1);
    }

    PhotoType type;
    switch (dto.type) {
      case 'article':
        type = PhotoType.article;
        break;
      case 'image':
        type = PhotoType.image;
        break;
      case 'video':
        type = PhotoType.video;
        break;
      default:
        type = PhotoType.invalid;
    }

    return Photo(
      id: id,
      type: type,
      createdAt: createdAt,
      title: dto.title,
      content: dto.content,
      url: dto.url,
      caption: dto.caption,
    );
  }
}
