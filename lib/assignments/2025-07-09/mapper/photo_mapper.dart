import 'package:modu_3_dart_study/assignments/2025-07-09/dto/photo_dto.dart';

import '../core/photo_type_enum.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: (id is int ? id : int.parse(id)) ?? 0,
      //id?.toInt() ?? 0,
      type: PhotoType.fromString(type ?? ''),
      title: title ?? '',
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: DateTime.tryParse(createdAt ?? '9999-01-01') ?? DateTime(9999),
    );
  }
}

void main() {
  print(int.tryParse(3 as String));
}
