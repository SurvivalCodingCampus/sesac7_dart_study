import 'package:modu_3_dart_study/20250709/dto/photo_dto.dart';

import '../model/photo.dart';

extension PhotoMapper on PhotoDto {

  Photo toPhoto() {
    Type typeValue;
    DateTime dateTime;
    String strId;

    strId = id.toString();

    try {
      dateTime = createdAt != null ? DateTime.parse(createdAt!) : DateTime.now();
    } catch (e) {
      dateTime = DateTime.now();
    }

    switch (type) {
      case 'article':
        typeValue = Type.Article;
        break;
      case 'image':
        typeValue = Type.Image;
        break;
      case 'video':
        typeValue = Type.Video;
        break;
      default:
        typeValue = Type.Unknown;
        break;
    }

    return Photo(
      id: strId,
      type: typeValue,
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: dateTime
    );
  }
}