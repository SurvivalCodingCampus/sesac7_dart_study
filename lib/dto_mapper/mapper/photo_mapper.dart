import 'package:modu_3_dart_study/dto_mapper/dto/photo_dto.dart';
import 'package:modu_3_dart_study/dto_mapper/model/photo.dart';

extension DtoToModel on PhotoDto {
  Photo toPhoto() {
    int convertedId = -1; // 잘못된 값이 설정되었을 경우 -1(오류값)으로 설정
    Type convertedType;

    if (id is int) {
      convertedId = id as int;
    }
    if (id is String) {
      convertedId = int.tryParse(id as String) ?? -1;
    }

    switch (type?.toLowerCase()) {
      case 'article':
        convertedType = Type.Article;
      case 'image':
        convertedType = Type.Image;
      case 'video':
        convertedType = Type.Video;
      default:
        convertedType = Type.Unknown;
    }

    return Photo(
      id: convertedId,
      type: convertedType,
      title: title == '' ? 'unknown' : (title ?? 'unknown'),
      url: url == '' ? 'unknown' : (url ?? 'unknown'),
      caption: caption == '' ? 'unknown' : (caption ?? 'unknown'),
      content: content == '' ? 'unknown' : (content ?? 'unknown'),
      createdAt: DateTime.utc(
        int.parse(createdAt.substring(0, 4)),
        int.parse(createdAt.substring(5, 7)),
        int.parse(createdAt.substring(8, 10)),
      ),
    );
  }
}
