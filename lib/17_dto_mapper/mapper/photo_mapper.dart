import 'package:modu_3_dart_study/17_dto_mapper/media_type.dart';

import '../dto/photo_dto.dart';
import '../model/photo.dart';

extension DtoToPhotoMapper on PhotoDto {
  Photo toModel() {
    return Photo(
      id: (id is num) ? id.toInt() : -1,
      type: switch (type) {
        'article' => MediaType.article,
        'image' => MediaType.image,
        'video' => MediaType.video,
        'unknown' => MediaType.unknown,
        _ => MediaType.unknown,
      },
      url: (url is String) ? url : 'null',
      caption: (caption is String) ? caption : 'null',
      title: (title is String) ? title : 'null',
      content: (content is String) ? content : 'null',
      createdAt: toDateTime(createdAt),
    );
  }

  DateTime toDateTime(dynamic date) {
    final defaultDate = '0000-00-00';
    final dateData = ((date is String) ? date : defaultDate).split('-');

    dateData[0] = (dateData[0].isEmpty || dateData[0].length < 4)
        ? '0000'
        : dateData[0];
    dateData[1] = (dateData[1].isEmpty || dateData[1].length < 2)
        ? '00'
        : dateData[1];
    dateData[2] = (dateData[2].isEmpty || dateData[2].length < 2)
        ? '00'
        : dateData[2];

    return DateTime(
      int.parse(dateData[0]),
      int.parse(dateData[1]),
      int.parse(dateData[2]),
    );
  }
}
