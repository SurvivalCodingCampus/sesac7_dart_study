import 'package:modu_3_dart_study/20250709/dto/photo_dto.dart';

import '../model/photo.dart';

extension PhotoMapper on PhotoDto {

  Photo toPhoto() {
    final strId = id?.toString() ?? '';
    final dateTime = _parseDateTime(createdAt);
    final typeValue = _parseType(type);

    return Photo(
      id: strId,
      type: typeValue,
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: dateTime,
    );
  }

  // 값이 없거나 예외상황에서는 가장 예전 날짜로 셋팅(1970-01-01 00:00:00 UTC)
  DateTime _parseDateTime(String? dateStr) {
    try {
      return dateStr != null ? DateTime.parse(dateStr) : DateTime.fromMillisecondsSinceEpoch(0);
    } catch (_) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }

  Type _parseType(String? typeStr) {
    const typeMap = {
      'article': Type.Article,
      'image': Type.Image,
      'video': Type.Video,
    };

    return typeMap[typeStr] ?? Type.Unknown;
  }

}